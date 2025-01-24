import 'package:flutter/material.dart';
import 'package:nsbaragi/apparent_weather/screens/statistic.dart';
import 'package:nsbaragi/apparent_weather/screens/weather.dart';

class ApparentWeatherView extends StatelessWidget {
  const ApparentWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(width: MediaQuery.of(context).size.width, height: 24),

          Weather(),

          Statistic(),
        ],
      ),
    );
  }
}
