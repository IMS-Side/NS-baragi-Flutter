import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({required this.child, super.key});

  final ShortWeatherController shortWeatherController = Get.find<ShortWeatherController>();
  //여기다가 이제 시간대별로 어떻게 보일지 조정해서 색을 추가하면 됨.

  final basic = [
    const Color(0xFF4EB5F4),
    const Color(0xFFA2CFF9),
    const Color(0x80D2DAEC),
  ];
  final basic_stop = [
    0.13, // 13% 위치
    0.70, // 70% 위치
    1.0,  // 100% 위치
  ];
  final sunset = [
    const Color(0xFF342D95),
    const Color(0xFFA480CF),
    const Color(0x80E99783),
  ];
  final sunset_stop = [
    0.13,
    0.56,
    0.84,
  ];
  final night = [
    const Color(0xFF202246),
    const Color(0xFF415ABD),
    const Color(0x807088AC),
  ];
  final night_stop = [
    0.13, // 13% 위치
    0.70, // 70% 위치
    1.0,  // 100% 위치
  ];
  final cloudy = [
    const Color(0xFF737896),
    const Color(0xFF6B82A3),
    const Color(0xFF82A7C0),
    const Color(0x80E5E6E4),
  ];
  final cloudy_stop = [
    0.13,
    0.37,
    0.71,
    1.0,
  ];
  final snow = [
    const Color(0xFFA0C7FB),
    const Color(0xFFB8C5F0),
    const Color(0xFFDCF5F8),
  ];
  final snow_stop = [
    0.13,
    0.87,
    1.0,
  ];

  //final background;
  // 조건문으로 시간에 따라서 background 변수에

  List<Color> getBackgroundColors() {
    final now = DateTime.now();
    final hour = now.hour;

    //날씨 상태에 따라 배경 변경
    final description = shortWeatherController.weatherDescription; //하늘 상태 가져오기
    if(description.contains('눈')) return snow;
    if(description.contains('비') || description.contains('흐림')) return cloudy;

    log("$now , $hour");

    //시간대
    if(hour >= 8 && hour <= 18){
      return basic;
    }else if(hour > 18 && hour <= 19){
      return sunset;
    }else{
      return night;
    }
  }

  // 그라디언트 스톱 반환
  List<double> getGradientStops() {
    final now = DateTime.now();
    final hour = now.hour;

    //날씨 상태에 따라 배경 변경
    final description = shortWeatherController.weatherDescription; //하늘 상태 가져오기
    if(description.contains('눈')) return snow_stop;
    if(description.contains('구름') || description.contains('흐림')) return cloudy_stop;


    if (hour >= 6 && hour < 12) {
      return basic_stop; // 아침
    } else if (hour >= 12 && hour < 18) {
      return sunset_stop; // 석양
    } else {
      return night_stop; // 밤
    }
  }


  @override
  Widget build(BuildContext context) {
    return Obx((){
      final colors = getBackgroundColors();
      final stops = getGradientStops();

      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: child,
      );
    });
  }
}

