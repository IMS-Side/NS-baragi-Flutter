import 'package:flutter/material.dart';
import 'package:nsbaragi/suggest_clothes/widgets/statisticCard.dart';

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
          child: Column(
            children: [
              Container(
                height: 575,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Text(
                          '아우터',
                          style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      left: 0,
                      child: StatisticCard(),
                    ),
                    Positioned(
                      top: 26,
                      right: 0,
                      child: StatisticCard(),
                    ),
                    
                    Positioned(
                      top: 202,
                      left: 0,
                      child: Text(
                        '상의',
                        style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 228,
                      left: 0,
                      child: StatisticCard(),
                    ),
                    Positioned(
                      top: 228,
                      right: 0,
                      child: StatisticCard(),
                    ),
                    
                    Positioned(
                      top: 404,
                      left: 0,
                      child: Text(
                        '하의',
                        style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 430,
                      left: 0,
                      child: StatisticCard(),
                    ),
                    Positioned(
                      top: 430,
                      right: 0,
                      child: StatisticCard(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
