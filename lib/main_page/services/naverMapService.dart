import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nsbaragi/main_page/services/locationService.dart';
import 'package:http/http.dart' as http;

class NaverMapService{
  late Future<bool> naverMapInitFuture;
  final Completer<NaverMapController> mapControllerCompleter = Completer();
  final LocationService _locationService = LocationService(); //위치 서비스
  final String clientId = dotenv.env['NAVER_MAP_CLIENT_ID'] ?? '';
  final String clientSecret = dotenv.env['NAVER_MAP_CLIENT_SECRET'] ?? '';

  NaverMapService(){
    naverMapInitFuture = _initializeNaverMap();
  }

  //네이버 맵 초기화
  Future<bool> _initializeNaverMap() async {
    try{
      await NaverMapSdk.instance.initialize(
        clientId: dotenv.env['NAVER_MAP_CLIENT_ID'] ?? '',
        onAuthFailed: (error) => log("네이버맵 인증 오류 : $error", name: "onAuthFailed"),
      );
      return true;
    }catch(e){
      log("네이버 맵 초기화 실패 : $e", name: "NaverMapinit");
      return false;
    }
  }

  void setMapController(NaverMapController controller){
    if(!mapControllerCompleter.isCompleted){
      mapControllerCompleter.complete(controller);
    }
  }

  //현재 위치를 주소로 변환
  Future<Map<String, dynamic>?> getCrntAddress() async {
    Position? position = await _locationService.getCurrentLocation();
    if(position != null){
      return await reverseGeocode(position.latitude, position.longitude);
    }
    return null; // 위치 정보 가져오기 실패.
  }

  //좌표 -> 주소 변환
  Future<Map<String, dynamic>?> reverseGeocode(double latitude, double longitude) async {
    final String url =
        'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=$longitude,$latitude&output=json';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'X-NCP-APIGW-API-KEY-ID': clientId,
        'X-NCP-APIGW-API-KEY': clientSecret,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['results'].isNotEmpty) {
        final regionData = data['results'][0]['region'];

        String countryCode = regionData['area0']['name'];
        String admCode = data['results'][0]['code']['id'] ?? "알 수 없음"; //행정동 코드 추가

        Map<String, String> countryNames = {
          "kr": "대한민국",
          "us": "미국",
          "jp": "일본",
          "cn": "중국",
          "fr": "프랑스",
          "de": "독일",
          "gb": "영국",
          "ru": "러시아",
          "in": "인도",
          "br": "브라질",
        };

        String countryName = countryNames[countryCode] ?? countryCode;

        return {
          "country": countryName, // 나라
          "region1": regionData['area1']['name'], // 시/도
          "region2": regionData['area2']['name'], // 시/군/구
          "region3": regionData['area3']['name'], // 읍/면/동
          "admCode": admCode //행정동 코드
        };
      }
    }
    return null;
  }

  //주소 -> 좌표 변환
  Future<Map<String, dynamic>?> geocodeAddress(String addr) async{
    final String url = 'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=$addr';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'X-NCP-APIGW-API-KEY-ID': clientId,
        'X-NCP-APIGW-API-KEY': clientSecret,
      },
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      if (data['addresses'].isNotEmpty) {
        return {
          'latitude': double.parse(data['addresses'][0]['y']),
          'longitude': double.parse(data['addresses'][0]['x']),
        };
      }
    }
    return null;
  }

  //주소 검색 기능
  Future<Map<String, dynamic>?> searchAddress(String query) async {
    final String encodeQuery = Uri.encodeQueryComponent(query); //인코딩 하니 해결됨.
    final String url =
        'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=$encodeQuery';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'X-NCP-APIGW-API-KEY-ID': clientId,
          'X-NCP-APIGW-API-KEY': clientSecret,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic>? data = jsonDecode(response.body);

        if (data == null || !data.containsKey('addresses') || data['addresses'] == null) {
          log("API 응답에 'addresses' 키가 없습니다.", name: "NaverMapService");
          return null;
        }

        final List<dynamic> addresses = data['addresses'];

        if (addresses.isEmpty) {
          log("검색된 주소가 없습니다. API 응답: ${jsonEncode(data)}", name: "NaverMapService");
          return null;
        }

        final Map<String, dynamic> firstAddress = addresses[0];
        final double lat = double.parse(firstAddress['y']);
        final double lng = double.parse(firstAddress['x']);
        final String address = firstAddress['roadAddress'] ?? firstAddress['jibunAddress'] ?? "알 수 없음";

        final Map<String, dynamic>? reverseData = await reverseGeocode(lat, lng);
        final String admCode = reverseData?["admCode"] ?? "알 수 없음";

        return {
          "latitude": lat,
          "longitude": lng,
          "address": address,
          "admCode" : admCode,
        };
      } else {
        log(" 네이버 Geocoding API 응답 오류: ${response.statusCode}", name: "NaverMapService");
      }
    } catch (e) {
      log("searchAddress() 오류 발생: $e", name: "NaverMapService");
    }

    return null;
  }
}