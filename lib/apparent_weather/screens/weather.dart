import 'package:flutter/material.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';
import 'package:get/get.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final ShortWeatherController shortWeatherController = Get.find<ShortWeatherController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Text(
          shortWeatherController.city.value,
          style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 13, height: 1.7, color: Colors.white),
        )),
        SizedBox(height: 9),
        Container(
          width: 392,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 106,
                height: 84,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '현재 기온',
                        style: TextStyle(fontFamily: 'PretendardRegular',fontSize: 12, height: 1.0, color: Colors.white)
                    ),
                    SizedBox(height: 4),
                    Obx(() => Text(
                          shortWeatherController.temperature.value,
                          style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 64, height: 1.0, color: Colors.white)
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 60),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '체감 기온',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 12, height: 1.0, color: Colors.white)
                    ),
                    SizedBox(height: 4),
                    Obx(() => Text(
                        shortWeatherController.feelTemp.value,
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 64, height: 1.0, color: Colors.white)
                    ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 26),
        Obx(() => Text(
            shortWeatherController.weatherDescription.value,
            style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white)
        ),
        ),
        SizedBox(height: 1),
        Obx(() => Text(
          '최고: ${shortWeatherController.tempMax.value} 최저: ${shortWeatherController.tempMin.value}',
          style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white),
        )),
        SizedBox(height: 2),
      ],
    );
  }
}