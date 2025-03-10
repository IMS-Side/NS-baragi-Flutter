import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';
import 'package:nsbaragi/main_page/services/naverMapService.dart';

class GeoMapController extends GetxController {
  final NaverMapService naverMapService = NaverMapService();
  final ShortWeatherController shortWeatherController =  Get.put(ShortWeatherController());

  var region0 = "국가".obs;
  var region1 = "시/도".obs;
  var region2 = "시/군/구".obs;
  var region3 = "읍/면/동".obs;
  var region = "".obs;
  var searchText = "".obs;
  var naverMapController = Rx<NaverMapController?>(null);

  @override
  void onInit() {
    super.onInit();
    getCrntAddress();
  }

  //현재 위치와 주소를 가져오는 메서드
  Future<void> getCrntAddress() async {
    List<String>? address = await naverMapService.getCrntAddress();
    if(address != null){
      region0.value = address[0];
      region1.value = address[1];
      region2.value = address[2];
      region3.value = address[3];
    }else{
      region0.value = "위치정보를 가져올 수 없습니다.";
    }
  }

  Future<void> searchAddress(String query) async {
    if(query.isEmpty) return;
    try{
      log("주소 검색 중 : $query", name: "GeoMapController");
      Map<String, dynamic>? searchResult = await naverMapService.searchAddress(query);

      if (searchResult != null) {
        double latitude = searchResult["latitude"];
        double longitude = searchResult["longitude"];
        String address = searchResult["address"];
        region.value = address; // 전체 주소 업데이트
        region3.value = address.split(" ").last; // 마지막 구역 정보 (읍/면/동)
        update();

        log("주소 검색 완료 : ${region.value}", name: "GeoMapController");
        await shortWeatherController.fetchWeather(latitude, longitude);
      }else{
        log("주소 검색 실패", name: "GeoMapController");
      }
    } catch(e) {
      log("searchAddress 오류 발생 : $e", name: "GeoMapController");
    }
  }

  //네이버 맵 컨트롤러 설정
  void setMapController(NaverMapController controller){
    naverMapController.value = controller;
    log("네이버 맵 컨트롤러 설정 완료", name: "GeoMapController");
  }
}