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
  final suset = [
    const Color(0xFF342D95),
    const Color(0xFFA480CF),
    const Color(0x80E99783),
  ];
  final suset_stop = [
    0.13,
    0.56,
    0.84,
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

