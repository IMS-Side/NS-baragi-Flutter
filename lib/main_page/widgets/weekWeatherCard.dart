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
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "오늘",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'PretendardSemiBold',
                  ),
                ),
                SizedBox(width: 20,),
                Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 8,),
                Icon(
                  Icons.cloud,
                  color: Colors.white,
                  size: 24,
                ),
              ],
            ),

            Row(
              children: [
                Icon(
                  Icons.water_drop,
                  color: Color(0xffC5D1DC),
                ),
                SizedBox(width: 4),
                Text(
                  "10%",
                  style: TextStyle(
                    color: Color(0xffC5D1DC),
                    fontSize: 16,
                    fontFamily: 'PretendardRegular',
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "5° / -2°",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'PretendardRegular',
                  ),
                ),
              ],
            )

          ],
        )

      ),
    );
  }
}
