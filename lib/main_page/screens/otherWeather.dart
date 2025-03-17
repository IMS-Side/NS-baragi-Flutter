import 'package:flutter/material.dart';
import 'package:nsbaragi/main_page/controllers/AirQualityController.dart';
import 'package:nsbaragi/main_page/controllers/geoMapController.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';
import 'package:nsbaragi/main_page/widgets/otherWeatherCard.dart';
import 'package:get/get.dart';

class OtherWeather extends StatelessWidget {

  final GeoMapController geoMapController = Get.put(GeoMapController());
  final ShortWeatherController shortWeatherController = Get.put(ShortWeatherController());
  final AirQualityController airQualityController = Get.put(AirQualityController());

  OtherWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const SizedBox(width: 11),
          Obx(() => OtherWeatherCard(
              title: "미세먼지",
              value: " ${airQualityController.pm10Dens.value} (${airQualityController.pm10.value} µg/m³)",
              icon: Icons.air
          )),
          const SizedBox(width: 10),
          Obx(() => OtherWeatherCard(
            title: "자외선 지수",
            value: shortWeatherController.crnt_uvi.value, // shortWeatherController.uvi.value를 사용
            icon: Icons.wb_sunny, // 자외선 지수 아이콘 (태양 아이콘)
          )),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

