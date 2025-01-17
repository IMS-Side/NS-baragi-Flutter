import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeekCard extends StatefulWidget {
  const WeekCard({super.key});

  @override
  State<WeekCard> createState() => _WeekCardState();
}

class _WeekCardState extends State<WeekCard> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //왼쪽 아이콘
            Text(
              "오늘",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            //날씨 Icons
            Row(
              children: [
                Icon(
                  Icons.cloud, //추후 변경예정
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 8,),
                Icon(
                  Icons.cloud, //추후 변경예정
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),
            //오른쪽 텍스트
            Row(
              children: [
                Icon(
                  Icons.water_drop, //추후 변경예정
                  color: Color(0xffC5D1DC),
                ),
                SizedBox(width: 4,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "10%",
                      style: TextStyle(
                        color: Color(0xffC5D1DC),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4,),
                    Text(
                      "5° / -2°",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )

      ),
    );
  }
}
