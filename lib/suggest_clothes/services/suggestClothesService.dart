import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:nsbaragi/main_page/controllers/geoMapController.dart';

class SuggestClothesService {

  final String baseUrl = dotenv.env['SERVER_URL'] ?? '';
  final GeoMapController geoMapController = Get.find<GeoMapController>();

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
}
