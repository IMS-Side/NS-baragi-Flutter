import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';
import '../widgets/weekWeatherCard.dart';
import 'package:intl/intl.dart';

class WeekWeather extends StatelessWidget {
  final ShortWeatherController weatherController = Get.put(ShortWeatherController());

  WeekWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 392,
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0x50467ABE),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Obx(() {
          if(weatherController.weeklyWeather.isEmpty){
            return const Center(child: CircularProgressIndicator(),);
          }

          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: weatherController.weeklyWeather.length,
            itemBuilder: (context, index){
              var day = weatherController.weeklyWeather[index]; // 각 날씨 데이터
              String weekday = DateFormat.E('ko_KR').format(day["date"]);

              return WeekCard(
                date: weekday,
                icon: day["icon"],
                pop: "${day["pop"].round()}%", // 강수 확률
                minTemp: day["min_temp"],
                maxTemp: day["max_temp"],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Color(0xFF8FC5E9), //나중에 색 변경 해줘야함.
                indent: 8,
                endIndent: 8,
              );
            },
          );
        }),

      ),
    );
  }
}
