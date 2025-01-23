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
        padding: const EdgeInsets.all(12.0), // 내부 여백
        //여백때문에 오류가 일어나나?
        decoration: BoxDecoration(
          color: const Color(0x40467ABE), // 배경색 (파란색)
          borderRadius: BorderRadius.circular(8.0), // 모서리 둥글게
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
                  ),
                ),
                Text(
                  "보통 (78µg/m³)",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
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