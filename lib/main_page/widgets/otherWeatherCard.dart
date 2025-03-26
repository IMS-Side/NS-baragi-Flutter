import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtherWeatherCard extends StatelessWidget {
  final String title; //카드 제목
  final String value; //카드 내용
  final IconData icon;

  const OtherWeatherCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 190,
        height: 80,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: const Color(0x40467ABE),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //아이콘
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
                SizedBox(width: 8,),
                //텍스트
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'PretendardRegular',
                      ),
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(height: 7,),
            Row(
              children: [
                SizedBox(width: 10,),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'PretendardSemiBold',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
