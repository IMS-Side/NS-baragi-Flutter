import 'package:flutter/material.dart';

class ClothesInputCard extends StatefulWidget {
  const ClothesInputCard({super.key});

  @override
  State<ClothesInputCard> createState() => _ClothesInputCardState();
}

class _ClothesInputCardState extends State<ClothesInputCard> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    List<String> options = ["추움", "좋음", "더움"];

    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      margin: EdgeInsets.zero,
      child: Container(
        width: size.width * 0.665,
        height: size.height * 0.040,
        decoration: BoxDecoration(
          color: const Color(0xFF467ABE).withOpacity(0.3),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: List.generate(options.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? const Color(0x80234C83) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    options[index],
                    style: TextStyle(
                      fontFamily: 'PretendardRegular',
                      fontSize: 10,
                      height: 1.7,
                      color: selectedIndex == index ? Colors.white : Colors.black, // 선택 시 글자색 변경
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
