import 'package:flutter/material.dart';

class StatisticWideCard extends StatefulWidget {
  final String title;
  final String state0;  // 상태0
  final String state1;  // 상태1
  final String state2;  // 상태2
  final String state3;  // 상태3
  final double value0;  // 값0
  final double value1;  // 값1
  final double value2;  // 값2
  final double value3;  // 값3

  const StatisticWideCard({
    super.key,
    required this.title,
    required this.state0,
    required this.state1,
    required this.state2,
    required this.state3,
    required this.value0,
    required this.value1,
    required this.value2,
    required this.value3,
  });

  @override
  State<StatisticWideCard> createState() => _StatisticWideCardState();
}

class _StatisticWideCardState extends State<StatisticWideCard> {
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
        width: 317,
        height: 135,
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
            SizedBox(height: 17),
            Container(
              width: 249,
              height: 81,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 9),
                      Text(
                        widget.state0,
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 170,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: widget.value0,
                            backgroundColor: Color(0x96666666),
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 9),
                      Text(
                        widget.state1,
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 170,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: widget.value1,
                            backgroundColor: Color(0x96666666),
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 9),
                      Text(
                        widget.state2,
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 170,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: widget.value2,
                            backgroundColor: Color(0x96666666),
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.sunny,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(width: 9),
                      Text(
                        widget.state3,
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 170,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: widget.value3,
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
