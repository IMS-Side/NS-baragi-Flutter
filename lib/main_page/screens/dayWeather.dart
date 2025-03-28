import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/shortWeatherController.dart';
import '../widgets/dayWeatherCard.dart';

class  DayWeather extends StatelessWidget {
  final ShortWeatherController weatherController = Get.find<ShortWeatherController>();

  DayWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 392,
      height: 174,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: const Color(0x33467ABE),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          Obx(() => Text(
            weatherController.weatherMessage.value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
          const SizedBox(height: 12),
          SizedBox(
            height: 116,
            child: Obx(() {
              if (weatherController.hourlyWeather.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weatherController.hourlyWeather.length,
                itemBuilder: (context, index) {
                  var data = weatherController.hourlyWeather[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: DayCard(
                      time: data["dt"],
                      temp: (data["temp"]).toDouble(),
                      pop: (data["pop"]).toDouble(),
                      weather: data["weather"],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
