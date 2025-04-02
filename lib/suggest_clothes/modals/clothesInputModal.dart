import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/controllers/geoMapController.dart';
import 'package:nsbaragi/suggest_clothes/controllers/suggestClothesController.dart';
import 'package:nsbaragi/suggest_clothes/modals/clothesInputCards.dart';

class ClothesInputModal extends StatelessWidget {
  ClothesInputModal({super.key});

  final SuggestClothesController suggestClothesController = Get.put(SuggestClothesController());
  final GeoMapController geoMapController = Get.put(GeoMapController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: Get.width * 0.031),
      child: Container(
        width: Get.width * 0.937,
        height: Get.height * 0.639,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFE4F1FF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            Positioned(
              top: Get.height * 0.017,
              right: Get.width * 0.032,
              child: GestureDetector(
                onTap: () => Get.back(), // 모달 닫기
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: Get.height * 0.033,
                ),
              ),
            ),
            Positioned(
              top: Get.height * 0.050,
              left: Get.width * 0.063,
              child: Text(
                '현재 입은 옷을 입력해 주세요.',
                style: TextStyle(fontFamily: 'PretendardBold', fontSize: 18, height: 1.7, color: Colors.black),
              ),
            ),
            Positioned(
              top: Get.height * 0.098,
              left: Get.width * 0.063,
              child: SizedBox(
                height: Get.height * 0.542, // 높이를 제한
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClothesInputCards(
                        category: '아우터',
                        items: [
                          {"name": "카디건", "serial_number": 101},
                          {"name": "얇은 카디건", "serial_number": 102},
                          {"name": "자켓", "serial_number": 103},
                          {"name": "야상", "serial_number": 104},
                          {"name": "가죽자켓", "serial_number": 105},
                          {"name": "트렌치코트", "serial_number": 106},
                          {"name": "코트", "serial_number": 107},
                          {"name": "두꺼운 코트", "serial_number": 108},
                          {"name": "패딩", "serial_number": 109},
                        ],
                      ),
                      SizedBox(height: Get.height * 0.010),
                      ClothesInputCards(
                        category: '상의',
                        items: [
                          {"name": "민소매", "serial_number": 201},
                          {"name": "반팔", "serial_number": 202},
                          {"name": "얇은 셔츠", "serial_number": 203},
                          {"name": "긴팔", "serial_number": 204},
                          {"name": "얇은 니트", "serial_number": 205},
                          {"name": "니트", "serial_number": 206},
                          {"name": "맨투맨", "serial_number": 207},
                        ],
                      ),
                      SizedBox(height: Get.height * 0.010),
                      ClothesInputCards(
                        category: '하의',
                        items: [
                          {"name": "반바지", "serial_number": 301},
                          {"name": "면바지", "serial_number": 302},
                          {"name": "청바지", "serial_number": 303},
                        ],
                      ),
                      SizedBox(height: Get.height * 0.010),
                      ClothesInputCards(
                        category: '기타',
                        items: [
                          {"name": "목도리", "serial_number": 401},
                          {"name": "기모제품", "serial_number": 402},
                          {"name": "레깅스", "serial_number": 403},
                          {"name": "스타킹", "serial_number": 404},
                        ],
                      ),
                      SizedBox(height: Get.height * 0.030),
                      Align(
                        alignment: Alignment(0.0, 1.0),
                        child: ElevatedButton(
                          onPressed: () => {
                            suggestClothesController.sendFeelClothes(geoMapController.admCode.value),
                            Navigator.pop(context)
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1A3761),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.303, vertical: Get.height * 0.008),
                          ),
                          child: Text(
                            '완료',
                            style: TextStyle(fontFamily: 'PretendardBold', fontSize: 13, height: 1.7, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.050),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
