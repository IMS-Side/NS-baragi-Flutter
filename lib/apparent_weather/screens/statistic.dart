import 'package:flutter/material.dart';
import 'package:nsbaragi/apparent_weather/widgets/statisticCard.dart';
import 'package:nsbaragi/apparent_weather/widgets/statisticWideCard.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 27),
        Container(
          width: 317,
          height: 314,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: StatisticCard(),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: StatisticCard(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: StatisticCard(),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: StatisticCard(),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        StatisticWideCard(),
        SizedBox(height: 36),
        ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1A3761),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 79.0, vertical: 7.0),
          ),
          child: Text(
              '체감날씨 입력하러가기',
              style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 13, height: 1.7, color: Colors.white),
          ),
        )
      ],
    );
  }
}
