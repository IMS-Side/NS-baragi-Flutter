import 'package:flutter/material.dart';
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
    return const Column(
        children: <Widget>[
          PresentWeather(),
          DayWeather(),
          // WeekWeather를 Expanded로 감싸기
          Expanded(
            child: WeekWeather(),
          ),
        ],
    );
  }
}
