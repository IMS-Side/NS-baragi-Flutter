import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '정왕동',
          style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 13, height: 1.7, color: Colors.white),
        ),
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
                    Text(
                        '88º',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 64, height: 1.0, color: Colors.white)
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
                    Text(
                        '03º',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 64, height: 1.0, color: Colors.white)
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 26),
        Text(
            '맑음',
            style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white)
        ),
        SizedBox(height: 1),
        Text(
            '최고: 13º 최저: -88º',
            style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white)
        ),
        SizedBox(height: 2),
      ],
    );
  }
}