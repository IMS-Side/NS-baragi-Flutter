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
        _temper(),//온도를 나타내는 위젯 호출
        _agreement(), //동의를 나타내는 위젯 호출
      ],
    );
  }
}

Widget _temper(){
  return const SingleChildScrollView(
      child: Column(
        children: [
          Text("정왕동",
            style: TextStyle(
                fontSize: 13,
                color: Colors.white //나중에 white로 바꿔야함.
            ),
          ),
          Text("12°C",
            style: TextStyle(
                fontSize: 64,
                color: Colors.white //나중에 white로 바꿔야함.
            ),
          ),
          Text("맑음",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white //나중에 white로 바꿔야함.
            ),
          ),
          SizedBox(height: 10,),
          Text("최고:13°C 최저:-88°C",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white //나중에 white로 바꿔야함.
            ),
          ),
          SizedBox(height: 10,),
        ],
      )
  );
}

Widget _agreement(){
  return SingleChildScrollView(
      child: Column(
        children: [
          const Text("현재 날씨에 동의하나요?",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white //나중에 white로 바꿔야함.
            ),
          ),
          const SizedBox(height: 5,),
          const Text("10%가 동의해요",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white //나중에 white로 바꿔야함.
            ),
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Row의 children을 가운데 정렬
            children: [
              SizedBox(
                width: 80,
                height: 22,
                child: OutlinedButton(
                  onPressed: () {
                    // 누르면 이벤트 실행
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: const Text(
                    "동의",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10), // 버튼 간 간격 추가
              SizedBox(
                width: 80,
                height: 22,
                child: OutlinedButton(
                  onPressed: () {
                    // 누르면 이벤트 실행
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: const Text(
                    "비동의",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          )

        ],
      ),
  );
}
