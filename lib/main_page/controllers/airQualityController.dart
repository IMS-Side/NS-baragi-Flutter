import 'dart:developer';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/controllers/geoMapController.dart';
import 'package:nsbaragi/main_page/services/airQualityService.dart';

class AirQualityController extends GetxController {
  final AirQualityService airQualityService = AirQualityService();
  final GeoMapController geoMapController = Get.find<GeoMapController>(); // 무한 재귀 방지

  // 미세먼지와 측정소 정보
  var pm10 = "0".obs; // 미세먼지 PM10
  var pm25 = "0".obs; // 초미세먼지 PM2.5
  var stationName = "측정소 없음".obs; // 측정소 이름
  var dataTime = "시간 없음".obs; // 측정 시간
  var pm10Dens = "정보없음".obs;

  @override
  void onInit() {
    super.onInit();

    //지역 변경 시 미세먼지 정보 업데이트 (시/도 + 시/군/구 + 읍/면/동 감지)
    everAll(
      [geoMapController.region1, geoMapController.region2, geoMapController.region3],
          (_) {
        final newRegion = "${geoMapController.region1.value} ${geoMapController.region2.value}";
        log("주소 변경 감지: $newRegion", name: "AirQualityController");
        fetchAirQuality(geoMapController.region1.value);
      },
    );

    //초기 실행 시 호출
    fetchAirQuality(geoMapController.region1.value);
  }

  void densPm10(String pm10){
    
    final int pm10Value = int.tryParse(pm10) ?? 0;

    if (pm10Value < 31) {
      pm10Dens.value = "좋음";
    } else if (pm10Value < 81) {
      pm10Dens.value = "보통";
    } else if (pm10Value < 151) {
      pm10Dens.value = "나쁨";
    } else {
      pm10Dens.value = "매우나쁨";
    }
  }

  //시/도명을 통해 미세먼지 데이터 가져오기
  Future<void> fetchAirQuality(String sidoName) async {
    try {
      //시/도명에 해당하는 측정소 목록 가져오기
      final List<String>? stations = await airQualityService.getStations(sidoName);

      //측정소가 없으면 종료
      if (stations == null || stations.isEmpty) {
        log("해당 시/도의 측정소 정보 없음: $sidoName", name: "AirQualityController");
        return;
      }

      //측정소 순차적으로 조회
      for (String selectedStation in stations) {
        log("측정소 조회 시도: $selectedStation", name: "AirQualityController");
        final airData = await airQualityService.getAirQuality(sidoName, selectedStation);

        if (airData != null) {
          //데이터가 있으면 업데이트 후 종료
          pm10.value = airData["pm10"] ?? "정보없음";
          pm25.value = airData["pm25"] ?? "정보없음";
          stationName.value = airData["stationName"] ?? "측정소 없음";
          dataTime.value = airData["dataTime"] ?? "시간 없음";
          densPm10(pm10.value);

          log("미세먼지 데이터 가져오기 성공: $selectedStation", name: "AirQualityController");
          return;
        }
      }

      //모든 측정소에서 데이터를 못 찾은 경우
      log("모든 측정소에서 미세먼지 데이터를 가져올 수 없음", name: "AirQualityController");

    } catch (e) {
      log("fetchAirQuality 오류 발생: $e", name: "AirQualityController");
    }
  }
}
