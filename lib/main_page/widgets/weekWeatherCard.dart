import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeekCard extends StatelessWidget {
  final String date;
  final IconData icon;
  final String pop;
  final String minTemp;
  final String maxTemp;

  const WeekCard({
    super.key,
    required this.date,
    required this.icon,
    required this.pop,
    required this.minTemp,
    required this.maxTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'PretendardSemiBold',
                    ),
                  ),
                  SizedBox(width: 20,),
                  Icon(
                    icon, //추후 아이콘 함수로 지정.
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
                    pop.isEmpty ? "0%" : pop,
                    style: const TextStyle(
                      color: Color(0xffC5D1DC),
                      fontSize: 15,
                      fontFamily: 'PretendardRegular',
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 90,
                    child:
                    Text(
                      "$maxTemp / $minTemp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'PretendardRegular',
                      ),
                    ),
                  )
                ],
              )
            ],
          )

      ),
    );

  }
}