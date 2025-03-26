import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({required this.child, super.key});

  final ShortWeatherController shortWeatherController = Get.find<ShortWeatherController>();

  // 기본 배경 색상 정의
  final List<Color> basic = [
    const Color(0xFF4EB5F4),
    const Color(0xFFA2CFF9),
    const Color(0x80D2DAEC),
  ];
  final List<double> basicStop = [0.13, 0.70, 1.0];

  final List<Color> sunset = [
    const Color(0xFF342D95),
    const Color(0xFFA480CF),
    const Color(0x80E99783),
  ];
  final List<double> sunsetStop = [0.13, 0.56, 0.84];

  final List<Color> night = [
    const Color(0xFF202246),
    const Color(0xFF415ABD),
    const Color(0x807088AC),
  ];
  final List<double> nightStop = [0.13, 0.70, 1.0];

  final List<Color> cloudy = [
    const Color(0xFF737896),
    const Color(0xFF6B82A3),
    const Color(0xFF82A7C0),
    const Color(0x80E5E6E4),
  ];
  final List<double> cloudyStop = [0.13, 0.37, 0.71, 1.0];

  final List<Color> snow = [
    const Color(0xFFA0C7FB),
    const Color(0xFFB8C5F0),
    const Color(0xFFDCF5F8),
  ];
  final List<double> snowStop = [0.13, 0.87, 1.0];

  // 날씨 및 시간에 따라 배경 색상 반환
  Map<String, dynamic> _getBackground() {
    final now = DateTime.now();
    final hour = now.hour;
    final description = shortWeatherController.weatherDescription.value; // .value 사용

    // 날씨 상태에 따라 배경 변경
    if (description.contains('눈')) {
      return {'colors': snow, 'stops': snowStop};
    }
    if (description.contains('비') || description.contains('흐림') || description.contains('구름')) {
      return {'colors': cloudy, 'stops': cloudyStop};
    }

    // 시간대에 따른 배경 변경 (8시~18시: 기본, 18시~20시: 석양, 그 외: 밤)
    if (hour >= 8 && hour < 18) {
      return {'colors': basic, 'stops': basicStop}; // 기본 (낮)
    } else if (hour >= 18 && hour < 20) {
      return {'colors': sunset, 'stops': sunsetStop}; // 석양
    } else {
      return {'colors': night, 'stops': nightStop}; // 밤
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final background = _getBackground();
      final colors = background['colors'] as List<Color>;
      final stops = background['stops'] as List<double>;

      log("현재 배경 업데이트: ${shortWeatherController.weatherDescription.value}, 시간: ${DateTime.now().hour}");

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
