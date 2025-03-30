import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/suggest_clothes/modals/clothesInputCard.dart';

class ClothesInputCards extends StatelessWidget {
  final String category;
  final List<String> items;

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
                      item,
                      style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
                    ),
                  ),
                  ClothesInputCard(
                    item: item,
                    options: ['추움', '좋음', '더움'],
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