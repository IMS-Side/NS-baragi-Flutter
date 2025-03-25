import 'dart:developer';

import 'package:get/get.dart';
import 'package:nsbaragi/main_page/services/agreeWeatherService.dart';

class AgreeWeatherController extends GetxController{
  final AgreeWeatherService agreeWeatherService = AgreeWeatherService();

  var agree = 0.obs;
  var disagree = 0.obs;
  var agreePer = 0.obs;

  //현재 지역의 공감 정보 불러오기
  Future<void> fetchAgreeStatus(String admCode) async {
    var data = await agreeWeatherService.getAgreeStatus(admCode);
    if(data != null){
      log("$data['likes']", name: "AgreeWeatherController");
      agree.value = data['likes'] ?? 0;
      disagree.value = data['dislikes'] ?? 0;
      // 공감 비율 계산 (0으로 나누는 경우 대비)
      if (agree.value + disagree.value > 0) {
        agreePer.value = ((agree.value / (agree.value + disagree.value)) * 100).round();
      } else {
        agreePer.value = 0;
      }
    }
  }

  //공감 또는 비공감 보내기
  Future<void> sendAgree(String admCode, int like) async {
    await agreeWeatherService.sendAgreeStatus(admCode, like);
    await fetchAgreeStatus(admCode); //새로고침
  }

}