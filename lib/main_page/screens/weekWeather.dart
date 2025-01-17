import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Flutter 기본 Material 라이브러리
import '../widgets/weekWeatherCard.dart'; // WeekCard 파일 가져오기


class WeekWeather extends StatefulWidget {
  const WeekWeather({super.key});

  @override
  State<WeekWeather> createState() => _WeekWeatherState();
}

class _WeekWeatherState extends State<WeekWeather> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5, // 높이 제한
      child: ListView(
        children: const <Widget>[
          WeekCard(), // WeekCard 호출
        ],
      ),
    );
  }
}
