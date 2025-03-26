import 'package:flutter/material.dart';
import 'package:nsbaragi/main_page/controllers/geoMapController.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/controllers/agreeWeatherController.dart';
import '../../apparent_weather/modals/weatherInputModal.dart';

class PresentWeather extends StatelessWidget {

  final ShortWeatherController shortWeatherController = Get.put(ShortWeatherController());
  final AgreeWeatherController agreeWeatherController = Get.put(AgreeWeatherController());
  final GeoMapController geoMapController = Get.put(GeoMapController());

  PresentWeather({super.key});

  final RxBool isAgree = false.obs; //동의/비동의 여부

  //모달창
  void _showWeatherInputDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return WeatherInputModal();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          _temper(), // 온도를 나타내는 위젯 호출
          _agreement(), // 동의를 나타내는 위젯 호출
        ],
      ),
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

        Obx(() {
          final agreeText = isAgree.value
              ? "${agreeWeatherController.agreePer.value}%가 동의하고 있어요."
              : "${agreeWeatherController.agree.value}명이 동의해요";

          return Text(
            agreeText,
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontFamily: 'PretendardRegular',
            ),
          );
        }),
        const SizedBox(height: 10,),

        //동의/비동의 버튼
        Obx( ()=> isAgree.value
            ? const SizedBox() //동의 버튼 클릭 시 사라짐.
            : Row(
              mainAxisAlignment: MainAxisAlignment.center, // Row의 children을 가운데 정렬
              children: [
                SizedBox(
                  width: 80,
                  height: 22,
                  child: OutlinedButton(
                    onPressed: () {
                      // 동의 이벤트 실행
                      agreeWeatherController.sendAgree(geoMapController.admCode.value, 1);
                      isAgree.value = true; //동의 후 버튼 숨기기
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
                      _showWeatherInputDialog(Get.context!);
                      agreeWeatherController.sendAgree(geoMapController.admCode.value, 0);
                      isAgree.value = true;
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
            )),
      ],
    );
  }
}
