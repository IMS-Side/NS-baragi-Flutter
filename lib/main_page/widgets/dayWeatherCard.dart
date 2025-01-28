import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayCard extends StatefulWidget {
  const DayCard({super.key});

  @override
  State<DayCard> createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "오전 11시",
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
        SizedBox(height: 9),
        Icon(
          Icons.cloud_outlined, // 구름 아이콘
          color: Colors.white,
          size: 30,
        ),
        SizedBox(height: 5),
        Text(
          "5°",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.water_drop_outlined, // 물방울 아이콘
              color: Colors.white,
              size: 15,
            ),
            Text(
              "10%",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
