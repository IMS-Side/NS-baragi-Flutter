import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatisticService {

  Future<Map<String, List<double>>> fetchStatistic() async {

    print('서비스 : fetchStatistic 함수 실행');
    String? code;

    // 임시 반환값 선언
    Map<String, List<double>> response;
    response = {
      "rain": [1.0, 1.0, 1.0, 1.0],
      "humidity": [1.0, 1.0, 1.0, 1.0],
      "sunlight": [1.0, 1.0, 1.0, 1.0],
      "wind": [1.0, 1.0, 1.0, 1.0],
      "cloud": [1.0, 1.0, 1.0, 1.0]
    };

    print('반환값 : ');
    print(response);

    // 행정동 코드 조회 API 호출
    Uri getCodeUri = Uri.parse('http://192.168.0.223:8080/address/find?sido=경기도&sigungu=시흥시');

    try {
      print('행정동 코드 조회 try문 진입');
      
      final codeResponse = await http.get(getCodeUri);
      print('get 함수 실행 완료');

      if (codeResponse.statusCode == 200) {
        final data = jsonDecode(codeResponse.body);
        code = data.toString();
        print('행정동 코드 조회 응답 데이터: $code');
      }
    } catch (e) {
      print('예외 발생 : $e');
    }

    // code가 null이면 체감날씨 통계 조회를 건너뜀
    if (code == null) {
      print('code가 null이므로 체감날씨 통계 조회를 수행하지 않음');
      return response;
    }

    // 체감날씨 통계 조회 API 호출
    Uri getStatisticUri = Uri.parse('http://192.168.0.223:8080/weather/count/$code');
    try {
      print('체감날씨 통계 조회 try문 진입');

      final statisticResponse = await http.get(getStatisticUri);
      print('get 함수 실행 완료');

      if (statisticResponse.statusCode == 200) {
        final List<dynamic> statisticData = jsonDecode(statisticResponse.body);
        print('체감날씨 통계 조회 응답 데이터: $statisticData');

        // 데이터에서 item을 하나씩 꺼내 퍼센티지로 변환 후 response 맵에 저장
        for (var item in statisticData) {
          String name = item["name"];

          // 값은 전부 0으로 설정
          double value1 = 0;
          double value2 = 0;
          double value3 = 0;
          double value4 = 0;

          // 만약 total이 0이 아니라면 (한 표 이상이라면) 각 퍼센티지를 계산해 value 값 설정
          if (item["totalCount"] != 0) {
            value1 = item["value1Count"]/item["totalCount"];
            value2 = item["value2Count"]/item["totalCount"];
            value3 = item["value3Count"]/item["totalCount"];
            value4 = item.containsKey("value4Count") ? item["value4Count"]/item["totalCount"] : 0;
          }
          
          // response에 저장 (이름이 존재할 경우 업데이트)
          if (response.containsKey(name)) {
            response[name] = [value1, value2, value3, value4];
          }
        }

        print('반환값 : ');
        print(response);
      }
    } catch (e) {
      print('예외 발생 : $e');
    }

    // response 반환
    return response;
  }
}