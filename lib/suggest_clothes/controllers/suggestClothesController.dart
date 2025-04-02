import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nsbaragi/suggest_clothes/services/suggestClothesService.dart';

class SuggestClothesController extends GetxController{
  
  final SuggestClothesService suggestClothesService = SuggestClothesService();

  // obs로 관리할 modal 관련 변수
  var selectedClothes = <int, int>{}.obs;

  // obs로 관리할 Weather 관련 변수
  var recommendation = "".obs;
  
  // obs로 관리할 Statistic 관련 변수
  var top = <String, List<double>>{}.obs;
  var bottom = <String, List<double>>{}.obs;
  var outer = <String, List<double>>{}.obs;


  @override
  void onInit() {
    super.onInit();

    fetchStatistics();
    fetchWeather();

  }



  void selectFeel(int serialNum, int feel){
    selectedClothes[serialNum] = feel;
    selectedClothes.refresh();
  }

  Future<void> sendFeelClothes(String code) async {
    int admCode = int.parse(code);

    if(selectedClothes.isEmpty){
      log("선택된 옷이 없습니다.", name:"SuggestClothesController");
      return;
    }

    List<Map<String,int>> surveyList = selectedClothes.entries.map((entry){
      return{
        "serial_number" : entry.key, //serial_number(int)
        "value" : entry.value, //1,2,3 (추움, 좋음, 더움)
      };
    }).toList();

    log("surveyList : ${surveyList}", name: "SuggestClothesController");

    bool isSuccess = await suggestClothesService.sendClothes({
      "code" : admCode,
      "surveylist" : surveyList,
    });

    if(isSuccess){
      log("설문이 성공적으로 제출되었습니다.", name: "SuggestClothesController");
    }else{
      log("설문 제출에 실패했습니다.", name: "SuggestClothesController");
    }

  }



  // Statistic 관련 데이터 받아옴
  Future<void> fetchStatistics() async {
    print('컨트롤러 : fetchStatistic 함수 실행');
    final statistics = await suggestClothesService.fetchStatistic();

    top.assignAll(statistics["top"] ?? {});
    bottom.assignAll(statistics["bottom"] ?? {});
    outer.assignAll(statistics["outer"] ?? {});

    print("업데이트된 top 데이터: $top");
    print("업데이트된 bottom 데이터: $bottom");
    print("업데이트된 outer 데이터: $outer");
  }



  // Weather 관련 데이터 설정
  Future<void> fetchWeather() async {
    print('컨트롤러 : fetchWeather 함수 실행');
    final weather = await suggestClothesService.fetchWeather();

    recommendation.value = weather["recommendation"];
  }

}