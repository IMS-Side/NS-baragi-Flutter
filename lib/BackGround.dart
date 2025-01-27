import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  final Widget child;

  Background({required this.child, super.key});

  //여기다가 이제 시간대별로 어떻게 보일지 조정해서 색을 추가하면 됨.

  final basic = [
    const Color(0xFF4EB5F4),
    const Color(0xFFA2CFF9),
    const Color(0x80D2DAEC),
  ];
  final basic_stop = [
    0.13, // 13% 위치
    0.70, // 70% 위치
    1.0,  // 100% 위치
  ];
  final sunset = [
    const Color(0xFF342D95),
    const Color(0xFFA480CF),
    const Color(0x80E99783),
  ];
  final sunset_stop = [
    0.13,
    0.56,
    0.84,
  ];
  final night = [
    const Color(0xFF202246),
    const Color(0xFF415ABD),
    const Color(0x807088AC),
  ];
  final night_stop = [
    0.13, // 13% 위치
    0.70, // 70% 위치
    1.0,  // 100% 위치
  ];
  final cloudy = [
    const Color(0xFF737896),
    const Color(0xFF6B82A3),
    const Color(0xFF82A7C0),
    const Color(0x80E5E6E4),
  ];
  final cloudy_stop = [
    0.13,
    0.37,
    0.71,
    1.0,
  ];
  final snow = [
    const Color(0xFFA0C7FB),
    const Color(0xFFB8C5F0),
    const Color(0xFFDCF5F8),
  ];
  final snow_stop = [
    0.13,
    0.87,
    1.0,
  ];

  //final background;
  // 조건문으로 시간에 따라서 background 변수에

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: basic,
          stops: basic_stop,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

