import 'dart:convert';
import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AirQualityService {
  final String apiKey = dotenv.env['AIRKOREA_API_KEY'] ?? '';

  Future<List<String>?> getStations(String sidoName) async {
    final String apiUrl =
        'http://apis.data.go.kr/B552584/MsrstnInfoInqireSvc/getMsrstnList'
        '?serviceKey=$apiKey&returnType=json&numOfRows=100&pageNo=1&addr=$sidoName';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data['response']['body']['items'] == null) {
          log("해당 시/도의 측정소 정보 없음: $sidoName", name: "AirQualityService");
          return [];
        }

        final List<dynamic> items = data['response']['body']['items'];

        //여기에서 map의 반환 타입을 String으로 변환
        final List<String> stationNames = items.map<String>((item) {
          return item['stationName'].toString();
        }).toList();

        log("측정소 목록: $stationNames", name: "AirQualityService");
        return stationNames;
      } else {
        log("측정소 목록 API 오류: ${response.statusCode}", name: "AirQualityService");
        return [];
      }
    } catch (e) {
      log("getStations() 오류 발생: $e", name: "AirQualityService");
      return [];
    }
  }
// 시/도명 변환
  String mapSidoName(String sidoName) {
    final mapping = {
      "서울특별시": "서울",
      "부산광역시": "부산",
      "대구광역시": "대구",
      "인천광역시": "인천",
      "경기도": "경기",
      "강원도": "강원",
    };
    return mapping[sidoName] ?? sidoName;
  }

// 측정소 이름 정제
  String cleanStationName(String stationName) {
    return stationName.replaceAll(RegExp(r'\([^)]*\)'), '').trim();
  }

// 미세먼지 정보 가져오기
  Future<Map<String, dynamic>?> getAirQuality(String sidoName, String stationName) async {
    final encodedSidoName = mapSidoName(sidoName);
    final cleanedStationName = cleanStationName(stationName);

    final url = 'http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty'
        '?serviceKey=$apiKey'
        '&returnType=json'
        '&sidoName=$encodedSidoName'
        '&numOfRows=10'
        '&pageNo=1';

    try {
      final response = await http.get(Uri.parse(url));
      //log("API 응답: ${response.body}", name: "AirQualityService");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final items = data['response']?['body']?['items'] ?? [];

        final matchedItem = items.firstWhere(
              (item) => (item['stationName'] as String).replaceAll(" ", "").toLowerCase() ==
              cleanedStationName.replaceAll(" ", "").toLowerCase(),
          orElse: () => null,
        );

        if (matchedItem != null) {
          return {
            "pm10": matchedItem["pm10Value"] ?? "정보없음",
            "pm25": matchedItem["pm25Value"] ?? "정보없음",
            "stationName": matchedItem["stationName"] ?? "측정소 없음",
            "dataTime": matchedItem["dataTime"] ?? "시간 없음",
          };
        }
      }
    } catch (e) {
      log("getAirQuality() 오류 발생: $e", name: "AirQualityService");
    }
    return null;
  }

}
