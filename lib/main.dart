import 'package:flutter/material.dart';

import 'main_page/screens/mainPageView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar: (),
      body: BasicBackground(
          child: MainPageView(),
      ),
    );
  }
}


class BasicBackground extends StatelessWidget {
  final Widget child;

  const BasicBackground({required this.child, super.key});

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




