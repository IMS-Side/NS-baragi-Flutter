import 'package:flutter/material.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';
import 'package:nsbaragi/main_page/widgets/otherWeatherCard.dart';
import 'package:get/get.dart';

class OtherWeather extends StatelessWidget {

  final ShortWeatherController shortWeatherController = Get.put(ShortWeatherController());

  OtherWeather({super.key});



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const SizedBox(width: 11),
          const OtherWeatherCard(
            title: "미세먼지",
            value: "보통 (78µg/m³)",
            icon: Icons.air, // 미세먼지 아이콘
          ),
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

