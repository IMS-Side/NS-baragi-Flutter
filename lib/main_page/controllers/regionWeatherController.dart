import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/widgets/regionWetherCard.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    loadSaveRegions();
  }

  //현재 위치 정보 가져오기
  void fetchCurrentLocation() async {
    await geoMapController.getCrntAddress();
    await shortWeatherController.fetchWeather();

    crntLocation.value = geoMapController.region3.value;
    crntTemp.value = shortWeatherController.temperature.value;
    crntIcon.value = shortWeatherController.crntIcon.value;
  }

  void addCard(String region, String temperature, IconData weatherIcon) async {
    searchCards.add(RegionWeatherCard(
        key: ValueKey('card${searchCards.length + 1}'),
        region: region,
        temperature: temperature,
        weatherIcon: weatherIcon
      ),
    );

    //저장된 지역 목록 업데이트
    await saveRegions();
  }

  //지역 삭제
  void removeCard(int index) async {
    searchCards.removeAt(index);
    await saveRegions();
  }

  //지역 정보를 JSON으로 변환 후 내부 저장소에 저장
  Future<void> saveRegions() async {
    final prefs = await SharedPreferences.getInstance();

    final regionList = searchCards.map((card){
      return {
        'region' : card.region,
        'temperature' : card.temperature,
        'weatherIcon': card.weatherIcon.codePoint,
      };
    }).toList();
    await prefs.setString('otherRegions', jsonEncode(regionList));
  }

  //저장된 지역 정보를 불러와서 카드로 변환
  Future<void> loadSaveRegions() async {
    final prefs = await SharedPreferences.getInstance();
    final saveData = prefs.getString('otherRegions');

    if(saveData != null) {
      final List<dynamic> decodeData = jsonDecode(saveData);
      searchCards.addAll(
        decodeData.map((data) {
          return RegionWeatherCard(
            key: ValueKey('card${searchCards.length + 1}'),
            region: data['region'],
            temperature: data['temperature'],
            weatherIcon: IconData(data['weatherIcon'], fontFamily: CupertinoIcons.iconFont),
          );
        }).toList(),
      );
    }

  }

}