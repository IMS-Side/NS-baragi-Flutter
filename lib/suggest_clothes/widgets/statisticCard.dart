import 'package:flutter/material.dart';

class StatisticCard extends StatefulWidget {
  const StatisticCard({super.key});

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
              'assets/images/sample_clothes.png',
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
                            value: 0.8,
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
                            value: 0.8,
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
                            value: 0.8,
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
