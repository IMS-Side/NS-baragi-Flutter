import 'package:flutter/cupertino.dart';
import 'package:nsbaragi/main_page/screens/dayWeather.dart';
import 'package:nsbaragi/main_page/screens/presentWeather.dart';
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
        //여기다가 이제 day, week, present Weather이라는 각각의 위젓을 가져올 예정.
        //presentWeather 위젯 추가
        PresentWeather(),
        //DayWeather 위젯 추가(예시로 온도 넘겨주기)
        DayWeather(),
        //WeekWeather 위젯 추가
        WeekWeather(),
      ],
    );
  }
}
