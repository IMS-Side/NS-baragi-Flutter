import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/suggest_clothes/controllers/suggestClothesController.dart';

class ClothesInputCard extends StatelessWidget {
  final String category;
  final List<String> options;

  ClothesInputCard({
    required this.category,
    required this.options,
    super.key,
  });

  // Get.put()을 사용하면 여러 개의 컨트롤러 인스턴스가 생성될 위험이 있음
  final SuggestClothesController controller = Get.find<SuggestClothesController>();

  @override
  Widget build(BuildContext context) {
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
            return Expanded(
              child: Obx(() {
                bool isSelected = controller.selectedClothes[category] == option;

                return GestureDetector(
                  onTap: () {
                    controller.selectClothes(category, option);
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? Color(0x80234C83) : Colors.transparent,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      option,
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 10,
                        height: 1.7,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            );
          }).toList(),
        ),
      ),
    );
  }
}
