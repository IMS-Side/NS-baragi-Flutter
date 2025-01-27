import 'package:flutter/material.dart';

import '../widgets/regionWetherCard.dart';

class RegionWeather extends StatefulWidget {
  const RegionWeather({super.key});

  @override
  State<RegionWeather> createState() => _RegionWeatherState();
}

class _RegionWeatherState extends State<RegionWeather> {
  final List<Widget> cards = [ //임시로 만든 리스트 나중에 비워놔야함. 맨 위는 현재 위치 고정.
    const RegionWeatherCard(
      key: ValueKey('card1'), //1번이면 hasIcon true
      hasIcon: true,
    ),
    const RegionWeatherCard(
      key: ValueKey('card2'),
    ),
    const RegionWeatherCard(
      key: ValueKey('card3'),
    ),
  ];

  // 추후 API 추가 후 addCard() 사용할 예정.

  // void _addCard() {
  //   setState(() {
  //     cards.add(
  //       RegionWeatherCard(
  //         key: ValueKey('card${cards.length + 1}'),
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 45),
        ...cards,
        const SizedBox(height: 22),
        _addButton(),
      ],
    );
  }
}

Widget _addButton() {
  return Center(
    child: SizedBox(
      width: 180,
      height: 30,
      child: OutlinedButton(
        onPressed: () {
          //지역 찾는 모달창 소환
          //모달창에서 확인이 오면 addCard() 해서 ... 추가 할 수 있도록.
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Color(0xFF898989),
            width: 1.0,
          ),
        ),
        child: const Text(
          "지역 추가",
          style: TextStyle(
            color: Color(0xFF898989),
            fontSize: 10,
            fontFamily: 'PretendardRegular',
          ),
        ),
      ),
    ),
  );
}