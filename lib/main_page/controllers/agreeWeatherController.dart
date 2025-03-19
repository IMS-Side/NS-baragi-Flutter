
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/services/agreeWeatherService.dart';

class AgreeWeatherController extends GetxController{
  final AgreeWeatherService agreeWeatherService = AgreeWeatherService();

  var agree = 0.obs;
  var disagree = 0.obs;

  //현재 지역의 공감 정보 불러오기
  Future<void> fetchAgreeStatus(String admCode) async {
    var data = await agreeWeatherService.getAgreeStatus(admCode);
    if(data != null){
      agree.value = data['likes'] ?? 0;
      disagree.value = data['dislikes'] ?? 0;
    }
  }

  //공감 또는 비공감 보내기
  Future<void> sendAgree(String admCode, int like) async {
    await agreeWeatherService.sendAgreeStatus(admCode, like);
    await fetchAgreeStatus(admCode); //새로고침
  }

}