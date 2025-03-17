import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/widgets/regionWetherCard.dart';
import 'geoMapController.dart';
import 'shortWeatherController.dart';

class RegionWeatherController extends GetxController {
  final GeoMapController geoMapController =  Get.put(GeoMapController());
  final ShortWeatherController shortWeatherController =  Get.put(ShortWeatherController());

  //현재 위치 정보
  var crntLocation = "현재위치".obs;
  var crntTemp = "N/A".obs;
  var crntIcon = CupertinoIcons.location_solid.obs;

  //검색 지역 리스트
  var searchCards = <RegionWeatherCard>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCurrentLocation();
  }

  //현재 위치 정보 가져오기
  void fetchCurrentLocation() async {
    await geoMapController.getCrntAddress();
    await shortWeatherController.fetchWeather();

    crntLocation.value = geoMapController.region3.value;
    crntTemp.value = shortWeatherController.temperature.value;
    crntIcon.value = shortWeatherController.crntIcon.value;
  }

  void addCard(String region, String temperature, IconData weatherIcon){
    searchCards.add(RegionWeatherCard(
        key: ValueKey('card${searchCards.length + 1}'),
        region: region,
        temperature: temperature,
        weatherIcon: weatherIcon
    ));
  }

  void removeCard(int index){
    searchCards.removeAt(index);
  }

}