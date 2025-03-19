import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/apparent_weather/controllers/apparentWeatherController.dart';
import 'package:nsbaragi/apparent_weather/modals/weatherInputModal.dart';
import 'package:nsbaragi/apparent_weather/widgets/statisticCard.dart';
import 'package:nsbaragi/apparent_weather/widgets/statisticWideCard.dart';

class Statistic extends StatelessWidget {

  final ApparentWeatherController controller = Get.find<ApparentWeatherController>();

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
                child: StatisticCard(
                  title: '비',
                  state0: '없음',
                  state1: '보통',
                  state2: '많음',
                  value0: controller.rain[0],
                  value1: controller.rain[1],
                  value2: controller.rain[2],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: StatisticCard(
                  title: '습도',
                  state0: '낮음',
                  state1: '보통',
                  state2: '습함',
                  value0: controller.humidity[0],
                  value1: controller.humidity[1],
                  value2: controller.humidity[2],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: StatisticCard(
                  title: '햇살',
                  state0: '조금',
                  state1: '보통',
                  state2: '많음',
                  value0: controller.sunlight[0],
                  value1: controller.sunlight[1],
                  value2: controller.sunlight[2],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: StatisticCard(
                  title: '바람',
                  state0: '없음',
                  state1: '보통',
                  state2: '많음',
                  value0: controller.wind[0],
                  value1: controller.wind[1],
                  value2: controller.wind[2],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        StatisticWideCard(
          title: '하늘상태',
          state0: '많음',
          state1: '구름 조금',
          state2: '구름 많음',
          state3: '흐림',
          value0: controller.cloud[0],
          value1: controller.cloud[1],
          value2: controller.cloud[2],
          value3: controller.cloud[3],
        ),
        SizedBox(height: 36),
        ElevatedButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (context) { return WeatherInputModal(); }
            );
          },
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
