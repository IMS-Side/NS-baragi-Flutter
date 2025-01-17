import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PresentWeather extends StatefulWidget {
  const PresentWeather({super.key});

  @override
  State<PresentWeather> createState() => _PresentWeatherState();
}

class _PresentWeatherState extends State<PresentWeather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _temper(), //온도를 나타내는 위젯 호출
        _agreement(), //동의를 나타내는 위젯 호출
      ],
    );
  }
}

Widget _temper(){
  return const Column(
    children: [
      Text("정왕동",
        style: TextStyle(
          fontSize: 13,
          color: Colors.black //나중에 white로 바꿔야함.
        ),
      ),
      Text("12°C",
        style: TextStyle(
            fontSize: 64,
            color: Colors.black //나중에 white로 바꿔야함.
        ),
      ),
      Text("맑음",
        style: TextStyle(
            fontSize: 12,
            color: Colors.black //나중에 white로 바꿔야함.
        ),
      ),
      Text("최고:13°C 최저:-88°C",
        style: TextStyle(
            fontSize: 12,
            color: Colors.black //나중에 white로 바꿔야함.
        ),
      ),
    ],
  );
}

Widget _agreement(){
  return Column(
    children: [
      const Text("현재 날씨에 동의하나요?",
        style: TextStyle(
          fontSize: 10,
          color: Colors.black //나중에 white로 바꿔야함.
        ),
      ),
      const Text("10%가 동의해요",
        style: TextStyle(
            fontSize: 10,
            color: Colors.black //나중에 white로 바꿔야함.
        ),
      ),
      OutlinedButton(
          onPressed: (){
            //누르면 이벤트 실행
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              //color: Colors.white,
              width: 1.0,
            ),
          ),
          child: const Text("동의",
            style: TextStyle(
              fontSize: 10,
            ),
          )
      ),
      OutlinedButton(
          onPressed: (){
            //누르면 이벤트 실행
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              //color: Colors.white,
              width: 1.0,
            ),
          ),
          child: const Text("비동의",
            style: TextStyle(
              fontSize: 10,
            ),
          )
      ),
    ],

  );
}
