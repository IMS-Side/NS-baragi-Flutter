import 'package:flutter/material.dart';
import 'package:nsbaragi/main_page/screens/otherWeather.dart';
import 'package:nsbaragi/main_page/screens/presentWeather.dart';
import 'package:nsbaragi/main_page/screens/dayWeather.dart';
import 'package:nsbaragi/main_page/screens/weekWeather.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PresentWeather(), // 현재 날씨
          const SizedBox(height: 12), // 사이 간격
          DayWeather(), // 하루 날씨
          const SizedBox(height: 12), // 사이 간격
          WeekWeather(), // 주간 날씨
          const SizedBox(height: 12), // 사이 간격
          OtherWeather(), // 기타 날씨
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
