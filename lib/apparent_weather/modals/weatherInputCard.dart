import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/apparent_weather/controllers/apparentWeatherController.dart';

class WeatherInputCard extends StatelessWidget {
  final String name;
  final int serialNum;
  final List<String> options;

  const WeatherInputCard({
    super.key,
    required this.name,
    required this.serialNum,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final apparentWeatherController = Get.find<ApparentWeatherController>(); // 컨트롤러 가져오기
    final Size size = MediaQuery.of(context).size;

    return Obx(() {
      int? selectedIndex = apparentWeatherController.selectedWeathers[serialNum];

      return Card(
        color: Colors.transparent,
        elevation: 0.0,
        margin: EdgeInsets.zero,
        child: Container(
          width: size.width * 0.665,
          height: size.height * 0.040,
          decoration: BoxDecoration(
            color: const Color(0xFF467ABE).withOpacity(0.3),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: List.generate(options.length, (index) {
              final bool isSelected = selectedIndex == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (isSelected) {
                      apparentWeatherController.selectedWeathers.remove(serialNum);
                    } else {
                      apparentWeatherController.selectedWeathers[serialNum] = index;
                    }
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0x80234C83) : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      options[index],
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 10,
                        height: 1.7,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}