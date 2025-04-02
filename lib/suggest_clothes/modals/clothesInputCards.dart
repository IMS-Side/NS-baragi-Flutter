import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/suggest_clothes/modals/clothesInputCard.dart';

class ClothesInputCards extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> items;

  const ClothesInputCards({
    required this.category,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 16, height: 1.7, color: Colors.black),
        ),
        SizedBox(height: 8),
        Column(
          children: items.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.146,
                    child: Text(
                      item["name"],
                      style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
                    ),
                  ),
                  ClothesInputCard(
                    serialNum : item["serial_number"], //serial_number 전달
                    options: [1, 2, 3], // 추움-1 좋음-2 더움 -3
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
