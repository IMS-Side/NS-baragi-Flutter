import 'package:flutter/material.dart';
import 'package:nsbaragi/suggest_clothes/modals/clothesInputModal.dart';
import 'package:nsbaragi/main_page/controllers/shortWeatherController.dart';
import 'package:get/get.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final ShortWeatherController shortWeatherController = Get.find<ShortWeatherController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Text(
          shortWeatherController.city.value,
          style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 13, height: 1.7, color: Colors.white),
        )),
        SizedBox(height: 10),
        Container(
          width: 318,
          child: Column(
            children: [
              Container(
                height: 167,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Obx(() => Text(
                          shortWeatherController.temperature.value,
                          style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 48, height: 1.7, color: Colors.white)
                      ),
                      )
                    ),
                    Positioned(
                      top: 73,
                      left: 0,
                      child: Obx(() => Text(
                        '최고: ${shortWeatherController.tempMax.value}º 최저: ${shortWeatherController.tempMin.value}º',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 12, height: 1.7, color: Colors.white),
                      )),
                    ),
                    Positioned(
                      top: 97,
                      left: 0,
                      child: Container(
                        width: 108,
                        height: 44,
                        child: Text(
                            '얇은 패딩이나\n자켓을 추천해요',
                            softWrap: true,
                            style: TextStyle(fontFamily: 'PretendardBold', fontSize: 13, height: 1.7, color: Colors.white)
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: Image.asset(
                        'assets/images/sample_clothes.png',
                        width: 122,
                        height: 122,
                      ),
                    ),
                    Positioned(
                        top: 131,
                        right: 13,
                        child: OutlinedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) { return ClothesInputModal(); }
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fixedSize: const Size(96, 24),
                            minimumSize: const Size(96, 24),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            '옷 추천하러 가기',
                            style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 12, height: 1.7, color: Colors.white),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ]
    );
  }
}
