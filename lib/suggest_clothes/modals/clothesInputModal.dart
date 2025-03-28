import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/suggest_clothes/controllers/suggestClothesController.dart';
import 'package:nsbaragi/suggest_clothes/modals/clothesInputCards.dart';

class ClothesInputModal extends StatelessWidget {
  ClothesInputModal({Key? key}) : super(key: key);

  final SuggestClothesController controller = Get.put(SuggestClothesController());

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
                        items: ['자켓', '야상', '트렌치코드', '코트'],
                      ),
                      SizedBox(height: Get.height * 0.010),
                      ClothesInputCards(
                        category: '상의',
                        items: ['민소매', '반팔', '얇은 셔츠', '긴팔'],
                      ),
                      SizedBox(height: Get.height * 0.010),
                      ClothesInputCards(
                        category: '하의',
                        items: ['반바지', '면바지', '청바지', '후드 집업'],
                      ),
                      SizedBox(height: Get.height * 0.010),
                      ClothesInputCards(
                        category: '기타',
                        items: ['목도리', '기모', '레깅스', '스타킹'],
                      ),
                      SizedBox(height: Get.height * 0.030),
                      Align(
                        alignment: Alignment(0.0, 1.0),
                        child: ElevatedButton(
                          onPressed: () => {
                            //controller.sendFeelClothes()
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
