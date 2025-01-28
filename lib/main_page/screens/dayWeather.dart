import 'package:flutter/material.dart';
import '../widgets/dayWeatherCard.dart';


class  DayWeather extends StatefulWidget {
  const DayWeather({super.key});

  @override
  State<DayWeather> createState() => _DayWeatherState();
}

class _DayWeatherState extends State<DayWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392,
      height: 174,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0x33467ABE),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Text("밤에도 구름 많은 날씨가 이어져요",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox( // 일간 날씨 리스트
            height: 116, //위젯 높이
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // 가로 방향 스크롤
              itemCount: 12, // 총 아이템 수
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 11.0),
                  child: DayCard(), // 호출
              );
            },
          ),
        ),
        ],
      ),
    );
  }
}

