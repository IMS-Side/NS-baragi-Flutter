import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherWeatherCard extends StatefulWidget {
  const OtherWeatherCard({super.key});

  @override
  State<OtherWeatherCard> createState() => _OtherWeatherCardState();
}

class _OtherWeatherCardState extends State<OtherWeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 190,
        height: 80,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0x40467ABE), // 배경색 (파란색)
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //아이콘
            Icon(
              Icons.air,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 8,),
            //텍스트
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "미세먼지",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'PretendardRegular',
                  ),
                ),
                Text(
                  "보통 (78µg/m³)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'PretendardRegular',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}