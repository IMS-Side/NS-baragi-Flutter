import 'package:flutter/material.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';
import 'package:get/get.dart';

class PresentWeather extends StatelessWidget {

  final ShortWeatherController shortWeatherController = Get.put(ShortWeatherController());

  PresentWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _temper(), // 온도를 나타내는 위젯 호출
        _agreement(), // 동의를 나타내는 위젯 호출
      ],
    );
  }

  Widget _temper() {
    return Column(
      children: [
        const SizedBox(height: 24),
        Obx(() => Text(
          shortWeatherController.city.value,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            fontFamily: 'PretendardSemiBold',
          ),
        )),
        Obx(() => Text(
          shortWeatherController.temperature.value,
          style: const TextStyle(
            fontSize: 64,
            color: Colors.white,
            fontFamily: 'PretendardRegular',
          ),
        )),
        Obx(() => Text(
          shortWeatherController.weatherDescription.value,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontFamily: 'PretendardSemiBold',
          ),
        )),
        const SizedBox(height: 5),
        Obx(() => Text(
          "최고: ${shortWeatherController.tempMax.value} 최저: ${shortWeatherController.tempMin.value}",
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontFamily: 'PretendardSemiBold',
          ),
        )),
        const SizedBox(height: 15),
      ],
    );
  }
  Widget _agreement(){
    return Column(
      children: [
        const Text("현재 날씨에 동의하나요?",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontFamily: 'PretendardRegular',
          ),
        ),
        const SizedBox(height: 5,),
        const Text("10%가 동의해요",
          style: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontFamily: 'PretendardRegular',
          ),
        ),
        const SizedBox(height: 10,),
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
                    fontFamily: 'PretendardRegular',
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
                    fontFamily: 'PretendardRegular',
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
