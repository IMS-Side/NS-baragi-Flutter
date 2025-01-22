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
    return Container(
      width: 392,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0x33467ABE),
          borderRadius: BorderRadius.circular(15)
      ),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index){
              return const Padding(
                padding: EdgeInsets.only(bottom: 2.0),
                child: WeekCard(),
              );
          },
          separatorBuilder: (context, index){
            return const Divider(
              color: Color(0xFF8FC5E9),
            );
            },
        ),
    );
  }
}
