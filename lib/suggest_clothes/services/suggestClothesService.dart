import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:nsbaragi/main_page/controllers/geoMapController.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';

class SuggestClothesService {

  final String baseUrl = dotenv.env['SERVER_URL'] ?? '';
  final GeoMapController geoMapController = Get.find<GeoMapController>();
  final ShortWeatherController shortWeatherController = Get.find<ShortWeatherController>();

  // 4.1 옷 설문조사 요청
  Future<bool> sendClothes(Map<String, dynamic> requestBody) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/cloth/add'), // 엔드포인트 추가
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody), // JSON 인코딩
      );

      log("서버 응답: ${response.body}", name: "SuggestClothesService");

      if (response.statusCode == 200) {
        return true; // 성공
      } else {
        return false; // 실패
      }
    } catch (e) {
      log("네트워크 오류: $e", name: "SuggestClothesService");
      return false;
    }
  }

  // fetchStatistic 메서드
  Future<Map<String, Map<String, List<double>>>> fetchStatistic() async {

    print('서비스 : fetchStatistic 함수 실행');

    // 행정동 코드가 설정될 때까지 기다림
    while (geoMapController.admCode.value == "행정동 코드" || geoMapController.admCode.value.isEmpty) {
      print("행정동 코드가 아직 설정되지 않음. 대기 중...");
      await Future.delayed(Duration(milliseconds: 500));
    }

    var admCode = geoMapController.admCode;

    // 임시 반환값 선언
    Map<String, Map<String, List<double>>> response;
    response = {
      "top" : {},
      "bottom" : {},
      "outer" : {}
    };

    print('반환값 : ');
    print(response);

    print('행정동 코드 조회 응답 데이터: $admCode');

    // 추천옷 통계 조회 API 호출
    Uri getStatisticUri = Uri.parse('$baseUrl/cloth/count/toptwo/$admCode');
    try {
      print('추천옷 통계 조회 try문 진입');

      final statisticResponse = await http.get(getStatisticUri);
      print('get 함수 실행 완료');

      if (statisticResponse.statusCode == 200) {
        final Map<String, dynamic> statisticData = jsonDecode(statisticResponse.body);
        print('추천옷 통계 조회 응답 데이터: $statisticData');

        // 데이터에서 카테고리(top, bottom, outer)를 하나씩 처리
        for (var entry in statisticData.entries) {
          String category = entry.key;
          List<dynamic> items = entry.value;

          for (var item in items) {
            String name = item["name"];

            // 값은 전부 0으로 설정
            double value1 = 0;
            double value2 = 0;
            double value3 = 0;

            // 만약 total이 0이 아니라면 (한 표 이상이라면) 각 퍼센티지를 계산해 value 값 설정
            if (item["totalCount"] != 0) {
              value1 = item["coldCount"]/item["totalCount"];
              value2 = item["normalCount"]/item["totalCount"];
              value3 = item["hotCount"]/item["totalCount"];
            }

            // response의 해당 카테고리에 저장
            response[category]?[name] = [value1, value2, value3];
          }
        }
      }

    } catch (e) {
      print('예외 발생 : $e');
    }
    
    // response 반환
    return response;
  }



  // fetchWeather 메서드
  Future<Map<String, dynamic>> fetchWeather() async {

    // 임시 반환값 선언
    var response = { "recommendation" : "", "rcmdIcon" : "" };

    // 현재 기온이 설정될 때까지 기다림
    while (shortWeatherController.temperature.value == "" || shortWeatherController.temperature.value.isEmpty) {
      print("현재 기온이 아직 설정되지 않음. 대기 중...");
      await Future.delayed(Duration(milliseconds: 1000));
    }

    var strTemp = shortWeatherController.temperature.value;

    String recommendation = '';
    String rcmdIcon = '';

    // temperature 값이 숫자인지 확인하고, 아니면 기본값 설정
    int temp = int.tryParse(strTemp.substring(0, strTemp.length-1)) ?? 0;

    // 온도 범위에 따른 추천 문구 설정
    if (temp >= 28) {
      recommendation = '민소매나\n반팔 티를 추천해요';
      rcmdIcon = 'assets/images/sleeveless.png';
    } else if (temp >= 23) {
      recommendation = '반팔 티와\n반바지를 추천해요';
      rcmdIcon = 'assets/images/t-shirt.png';
    } else if (temp >= 20) {
      recommendation = '긴팔 티와\n면바지를 추천해요';
      rcmdIcon = 'assets/images/longsleeve.png';
    } else if (temp >= 17) {
      recommendation = '얇은 가디건이나\n맨투맨을 추천해요';
      rcmdIcon = 'assets/images/cardigan.png';
    } else if (temp >= 12) {
      recommendation = '청바지와\n니트를 추천해요';
      rcmdIcon = 'assets/images/knit_sweater.png';
    } else if (temp >= 9) {
      recommendation = '트렌치 코트나\n야상을 추천해요';
      rcmdIcon = 'assets/images/trench_coat.png';
    } else if (temp >= 5) {
      recommendation = '울 코트와\n기모 옷을 추천해요';
      rcmdIcon = 'assets/images/coat.png';
    } else {
      recommendation = '두꺼운 코트나\n패딩을 추천해요';
      rcmdIcon = 'assets/images/puffer_jacket.png';
    }

    // response에 저장
    response["recommendation"] = recommendation;
    response["rcmdIcon"] = rcmdIcon;

    // response 반환
    return response;
  }
}
