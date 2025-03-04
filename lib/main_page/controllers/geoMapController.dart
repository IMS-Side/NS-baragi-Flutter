import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:nsbaragi/main_page/services/naverMapService.dart';

class GeoMapController extends GetxController {
  final NaverMapService naverMapService = NaverMapService();

  var region0 = "국가".obs;
  var region1 = "시/도".obs;
  var region2 = "시/군/구".obs;
  var region3 = "읍/면/동".obs;
  var region = "".obs;
  var naverMapController = Rx<NaverMapController?>(null);

  @override
  void onInit() {
    super.onInit();
    getCrntAddress();
  }

  //현재 위치와 주소를 가져오는 메서드
  void getCrntAddress() async {
    List<String>? address = await naverMapService.getCrntAddress();
    if(address != null){
      region0.value = address[0];
      region1.value = address[1];
      region2.value = address[2];
      region3.value = address[3];
      updateRegion(); //region 업데이트
    }else{
      region0.value = "위치정보를 가져올 수 없습니다.";
    }
  }

  //region을 업데이트하는 메서드 추가
  void updateRegion(){
    region.value = "${region1.value} ${region2.value}, ${region0.value}";
  }

  //네이버 맵 컨트롤러 설정
  void setMapController(NaverMapController controller){
    naverMapController.value = controller;
    log("네이버 맵 컨트롤러 설정 완료", name: "GeoMapController");
  }
}