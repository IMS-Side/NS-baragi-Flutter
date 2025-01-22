import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({required this.child, super.key});

  //여기다가 이제 시간대별로 어떻게 보일지 조정해서 색을 추가하면 됨.

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF4EB5F4),
            Color(0xFFA2CFF9),
            Color(0x80D2DAEC),
          ],
          stops: [
            0.13, // 13% 위치
            0.70, // 70% 위치
            1.0,  // 100% 위치
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

class SunSetBackground extends StatelessWidget {

  final Widget child;
  const SunSetBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF342D95),
            Color(0xFFA480CF),
            Color(0x80E99783),
          ],
          stops: [
            0.13, // 13% 위치
            0.56, // 70% 위치
            0.84,  // 100% 위치
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}

