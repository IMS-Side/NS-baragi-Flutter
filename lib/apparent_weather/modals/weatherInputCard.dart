import 'package:flutter/material.dart';

class WeatherInputCard extends StatefulWidget {
  final List<String> options; // 외부에서 선택지 전달

  const WeatherInputCard({super.key, required this.options});

  @override
  State<WeatherInputCard> createState() => _WeatherInputCardState();
}

class _WeatherInputCardState extends State<WeatherInputCard> {
  int? selectedIndex; // 선택된 인덱스를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
          children: List.generate(widget.options.length, (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index; // 선택된 옵션 업데이트
                  });
                },
                child: Container(
                  height: double.infinity, // 부모 높이 전체 사용
                  alignment: Alignment.center, // 텍스트를 중앙 정렬
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? const Color(0x80234C83) : Colors.transparent, // 선택 시 배경색 적용
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    widget.options[index],
                    style: TextStyle(
                      fontFamily: 'PretendardRegular',
                      fontSize: 10,
                      height: 1.7,
                      color: selectedIndex == index ? Colors.white : Colors.black, // 선택 시 텍스트 색 변경
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
