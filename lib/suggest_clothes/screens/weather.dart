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
                        '최고: ${shortWeatherController.tempMax.value} 최저: ${shortWeatherController.tempMin.value}',
                        style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 12, height: 1.7, color: Colors.white),
                      )),
                    ),
                    Positioned(
                      top: 97,
                      left: 0,
                      child: Container(
                        width: 108,
                        height: 44,
                        child: Obx(() {
                          String recommendation = '';

                          // temperature 값이 숫자인지 확인하고, 아니면 기본값 설정
                          int temp = int.tryParse(shortWeatherController.temperature.value) ?? 0;

                          // 온도 범위에 따른 추천 문구
                          if (temp >= 28) {
                            recommendation = '민소매나\n반팔 티를 추천해요';
                          } else if (temp >= 23) {
                            recommendation = '반팔 티와\n반바지를 추천해요';
                          } else if (temp >= 20) {
                            recommendation = '긴팔 티와\n면바지를 추천해요';
                          } else if (temp >= 17) {
                            recommendation = '얇은 가디건이나\n맨투맨을 추천해요';
                          } else if (temp >= 12) {
                            recommendation = '청바지와\n니트를 추천해요';
                          } else if (temp >= 9) {
                            recommendation = '트렌치 코트나\n야상을 추천해요';
                          } else if (temp >= 5) {
                            recommendation = '울 코트와\n기모 옷을 추천해요';
                          } else {
                            recommendation = '두꺼운 코트나\n패딩을 추천해요';
                          }

                          return Text(
                            recommendation,
                            softWrap: true,
                            style: TextStyle(fontFamily: 'PretendardBold', fontSize: 13, height: 1.7, color: Colors.white),
                          );
                        }),
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
