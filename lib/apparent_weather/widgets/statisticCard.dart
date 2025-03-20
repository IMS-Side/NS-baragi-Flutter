import 'dart:ffi';

import 'package:flutter/material.dart';

class StatisticCard extends StatefulWidget {
  final String title;   // 카드의 제목
  final String state0;  // 상태0
  final String state1;  // 상태1
  final String state2;  // 상태2
  final double value0;  // 값0
  final double value1;  // 값1
  final double value2;  // 값2

  const StatisticCard({
    super.key,
    required this.title,
    required this.state0,
    required this.state1,
    required this.state2,
    required this.value0,
    required this.value1,
    required this.value2,
  });

  @override
  State<StatisticCard> createState() => _StatisticCardState();
}

class _StatisticCardState extends State<StatisticCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 0.0,
      margin: EdgeInsets.zero,
      child: Container(
        width: 140,
        height: 145,
        decoration: BoxDecoration(
          color: const Color(0xFF467ABE).withOpacity(0.3),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 4),
            Text(
              widget.title,
              style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
            ),
            SizedBox(height: 13),
            Icon(
              Icons.sunny,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(height: 13),
            Container(
              width: 98,
              height: 51,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.state0,
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 71,
                        height: 3,
                        child: LinearProgressIndicator(
                          value: widget.value0,
                          backgroundColor: Color(0x96666666),
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.state1,
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 71,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: widget.value1,
                            backgroundColor: Color(0x96666666),
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.state2,
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 71,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: widget.value2,
                            backgroundColor: Color(0x96666666),
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
