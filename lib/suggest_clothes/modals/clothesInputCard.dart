import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/suggest_clothes/controllers/suggestClothesController.dart';

class ClothesInputCard extends StatelessWidget {
  final int serialNum;
  final List<int> options; // int 리스트로 변경

  ClothesInputCard({
    required this.serialNum,
    required this.options,
    super.key,
  });

  final SuggestClothesController suggestClothesController = Get.put(SuggestClothesController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int? selectedValue = suggestClothesController.selectedClothes[serialNum];

      return Card(
        color: Colors.transparent,
        elevation: 0.0,
        margin: EdgeInsets.zero,
        child: Container(
          width: Get.width * 0.665,
          height: Get.height * 0.040,
          decoration: BoxDecoration(
            color: const Color(0xFF467ABE).withOpacity(0.3),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: options.map((option) {
              final isSelected = selectedValue == option;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if(isSelected){
                      suggestClothesController.selectedClothes.remove(serialNum);
                    }else{
                      suggestClothesController.selectFeel(serialNum, option);
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
                      _convertValueToText(option), // 숫자를 텍스트로 변환하여 표시
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 10,
                        height: 1.7,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    });
  }

  String _convertValueToText(int value) {
    switch (value) {
      case 1:
        return "추움";
      case 2:
        return "좋음";
      case 3:
        return "더움";
      default:
        return "";
    }
  }
}
