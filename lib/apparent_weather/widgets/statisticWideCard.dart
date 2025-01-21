import 'package:flutter/material.dart';

class StatisticWideCard extends StatefulWidget {
  const StatisticWideCard({super.key});

  @override
  State<StatisticWideCard> createState() => _StatisticWideCardState();
}

class _StatisticWideCardState extends State<StatisticWideCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 0.0,
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
              '하늘상태',
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
                        '맑음',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 170,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: 0.8,
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
                        '구름 조금',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 170,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: 0.8,
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
                        '구름 많음',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 170,
                        height: 3,
                        child: LinearProgressIndicator(
                            value: 0.8,
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
                        '흐림',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.white),
                      ),
                      SizedBox(width: 3),
                      Container(
                        width: 170,
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
