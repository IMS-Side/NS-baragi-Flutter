import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/suggest_clothes/controllers/suggestClothesController.dart';
import 'package:nsbaragi/suggest_clothes/widgets/statisticCard.dart';

class Statistic extends StatelessWidget {

  final SuggestClothesController controller = Get.find<SuggestClothesController>();

  @override
  Widget build(BuildContext context) {

    List<List<double>> outerValues = controller.outer.values.toList();
    List<List<double>> topValues = controller.top.values.toList();
    List<List<double>> bottomValues = controller.bottom.values.toList();

    List<String> outerKeys = controller.outer.keys.toList();
    List<String> topKeys = controller.top.keys.toList();
    List<String> bottomKeys = controller.bottom.keys.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 27),
        Container(
          width: 317,
          child: Column(
            children: [
              Container(
                height: 575,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Text(
                        '아우터',
                        style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 26,
                      left: 0,
                      child: StatisticCard(
                        icon: outerKeys.length > 0
                            ? _getSafeAssetPath(outerKeys[0])
                            : "assets/images/sample_clothes.png",
                        value0: outerValues[0][0],
                        value1: outerValues[0][1],
                        value2: outerValues[0][2],
                      ),
                    ),
                    Positioned(
                      top: 26,
                      right: 0,
                      child: StatisticCard(
                        icon: outerKeys.length > 1
                            ? _getSafeAssetPath(outerKeys[1])
                            : "assets/images/sample_clothes.png",
                        value0: outerValues[1][0],
                        value1: outerValues[1][1],
                        value2: outerValues[1][2],
                      ),
                    ),

                    Positioned(
                      top: 202,
                      left: 0,
                      child: Text(
                        '상의',
                        style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 228,
                      left: 0,
                      child: StatisticCard(
                        icon: topKeys.length > 0
                            ? _getSafeAssetPath(topKeys[0])
                            : "assets/images/sample_clothes.png",
                        value0: topValues[0][0],
                        value1: topValues[0][1],
                        value2: topValues[0][2],
                      ),
                    ),
                    Positioned(
                      top: 228,
                      right: 0,
                      child: StatisticCard(
                        icon: topKeys.length > 1
                            ? _getSafeAssetPath(topKeys[1])
                            : "assets/images/sample_clothes.png",
                        value0: topValues[1][0],
                        value1: topValues[1][1],
                        value2: topValues[1][2],
                      ),
                    ),

                    Positioned(
                      top: 404,
                      left: 0,
                      child: Text(
                        '하의',
                        style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 12, height: 1.7, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 430,
                      left: 0,
                      child: StatisticCard(
                        icon: bottomKeys.length > 0
                            ? _getSafeAssetPath(bottomKeys[0])
                            : "assets/images/sample_clothes.png",
                        value0: bottomValues[0][0],
                        value1: bottomValues[0][1],
                        value2: bottomValues[0][2],
                      ),
                    ),
                    Positioned(
                      top: 430,
                      right: 0,
                      child: StatisticCard(
                        icon: bottomKeys.length > 1
                            ? _getSafeAssetPath(bottomKeys[1])
                            : "assets/images/sample_clothes.png",
                        value0: bottomValues[1][0],
                        value1: bottomValues[1][1],
                        value2: bottomValues[1][2],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getSafeAssetPath(String key) {
    return "assets/images/${key.replaceAll(' ', '_')}.png";
  }
}