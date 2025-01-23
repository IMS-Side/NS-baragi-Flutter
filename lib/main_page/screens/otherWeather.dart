import 'package:flutter/cupertino.dart';
import 'package:nsbaragi/main_page/widgets/otherWeatherCard.dart';

class OtherWeather extends StatefulWidget {
  const OtherWeather({super.key});

  @override
  State<OtherWeather> createState() => _OtherWeatherState();
}

class _OtherWeatherState extends State<OtherWeather> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
          children: [
            SizedBox(width: 11),
            OtherWeatherCard(),
            SizedBox(width: 10),
            OtherWeatherCard(),
            SizedBox(width: 10),
          ],
      ),
    );
  }
}
