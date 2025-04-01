import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/suggest_clothes/controllers/suggestClothesController.dart';
import 'package:nsbaragi/suggest_clothes/screens/statistic.dart';
import 'package:nsbaragi/suggest_clothes/screens/weather.dart';

class SuggestClothesView extends StatelessWidget {
  SuggestClothesView({super.key});

  final SuggestClothesController controller = Get.put(SuggestClothesController());

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
