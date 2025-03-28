import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/shortWeatherController.dart'; // 시간을 변환할 라이브러리


class DayCard extends StatelessWidget {
  final int time; // Unix 타임스탬프
  final double temp; // 온도
  final double pop; // 강수확률
  final String weather; // 날씨 상태

  const DayCard({
    super.key,
    required this.time,
    required this.temp,
    required this.pop,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final ShortWeatherController weatherController = Get.find<ShortWeatherController>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _formatTime(time),
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        SizedBox(height: 9),

        Icon(
          weatherController.weatherIcon(_convertWeatherToIconCode(weather)), //날씨 상태에 따른 아이콘
          color: Colors.white,
          size: 30,
        ),
        SizedBox(height: 5),
        Text(
          "${temp.round()}°", //온도 불러오기
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.water_drop_outlined, // 물방울 아이콘
              color: Colors.white,
              size: 15,
            ),
            Text(
              "${(pop * 100).toInt()}%", //강수확률 변환 0.1->10%..
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('a h시', 'ko_KR').format(dateTime);
  }
  //아이콘 변환
  String _convertWeatherToIconCode(String weather) {
    switch (weather.toLowerCase()) {
      case 'clear':
        return '01d';
      case 'clouds':
        return '03d';
      case 'rain':
        return '10d';
      case 'snow':
        return '13d';
      default:
        return '01d';
    }
}
}
