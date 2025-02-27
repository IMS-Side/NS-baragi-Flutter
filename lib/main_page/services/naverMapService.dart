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

  NaverMapService(){
    naverMapInitFuture = _initializeNaverMap();
  }

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
  Future<String?> getCrntAddress() async {
    Position? position = await _locationService.getCurrentLocation();
    if(position != null){
      return await reverseGeocode(position.latitude, position.longitude);
    }
    return "위치 정보를 가져올 수 없습니다.";
  }

  //좌표 -> 주소 변환
  Future<String?> reverseGeocode(double latitude, double longitude) async {
    final String clientId = dotenv.env['NAVER_MAP_CLIENT_ID'] ?? '' ;
    final String clientSecret = dotenv.env['NAVER_MAP_CLIENT_SECRET'] ?? '' ;

    final String url =
        'https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?coords=$longitude,$latitude&output=json';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'X-NCP-APIGW-API-KEY-ID': clientId,
        'X-NCP-APIGW-API-KEY': clientSecret,
      }
    );

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      if (data['results'].isNotEmpty) {
        return data['results'][0]['region']['area1']['name'] +
            " " +
            data['results'][0]['region']['area2']['name'] +
            " " +
            data['results'][0]['region']['area3']['name'];
      }
    }
    return null;
  }

  //주소 -> 좌표 변환
  Future<Map<String, dynamic>?> geocodeAddress(String addr) async{
    final String clientId = dotenv.env['NAVER_MAP_CLIENT_ID'] ?? '';
    final String clientSecret = dotenv.env['NAVER_MAP_CLIENT_SECRET'] ?? '';

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


}