import 'package:flutter/material.dart';
import 'package:nsbaragi/suggest_clothes/screens/statistic.dart';
import 'package:nsbaragi/suggest_clothes/screens/weather.dart';

class SuggestClothesView extends StatelessWidget {
  const SuggestClothesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(width: MediaQuery.of(context).size.width, height: 24),

          Weather(),

          Statistic(),

          SizedBox(width: MediaQuery.of(context).size.width, height: 80),
        ],
      ),
    );
  }
}
