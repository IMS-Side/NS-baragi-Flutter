import 'package:flutter/material.dart';

class StatisticCard extends StatefulWidget {
  final String icon;    // 아이콘
  final double value0;  // 값0
  final double value1;  // 값1
  final double value2;  // 값2

  const StatisticCard({
    super.key,
    required this.icon,
    required this.value0,
    required this.value1,
    required this.value2
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
            Image.asset(
              widget.icon,
              width: 70,
              height: 77,
            ),
            SizedBox(height: 5),
            Container(
              width: 98,
              height: 51,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '추움',
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
                        '좋음',
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
                        '더움',
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