import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/suggest_clothes/controllers/suggestClothesController.dart';

class ClothesInputCard extends StatelessWidget {
  final String item;
  final List<String> options;

  ClothesInputCard({
    required this.item,
    required this.options,
    super.key,
  });

  final SuggestClothesController controller = Get.put(SuggestClothesController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String? select = controller.selectedClothes[item];

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
            children: List.generate(options.length, (index) {
              final option = options[index];
              final isSelected = select == option;

              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.selectFeel(item, option),
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0x80234C83) : Colors.transparent,
                      borderRadius: BorderRadius.circular(30.0),
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
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}
