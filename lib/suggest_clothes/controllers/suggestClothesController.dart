import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nsbaragi/suggest_clothes/services/suggestClothesService.dart';

class SuggestClothesController extends GetxController{
  
  final SuggestClothesService suggestClothesService = SuggestClothesService();

  // obs로 관리할 modal 관련 변수
  var selectedClothes = <String, String>{}.obs;
  
  // obs로 관리할 Statistic 관련 변수
  var top = <String, List<double>>{}.obs;
  var bottom = <String, List<double>>{}.obs;
  var outer = <String, List<double>>{}.obs;


  @override
  void onInit() {
    super.onInit();

    fetchStatistics();

  }



  void selectFeel(String item, String feel){
    selectedClothes[item] = feel;
    selectedClothes.refresh();
  }

  Future<void> sendFeelClothes() async {

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

}