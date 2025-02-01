import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddRegionModal extends StatefulWidget {
  const AddRegionModal({super.key});

  @override
  State<AddRegionModal> createState() => _AddRegionModalState();
}

class _AddRegionModalState extends State<AddRegionModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386,
      height: 576,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          // 지도 넣을 부분
          Placeholder(),

          //검색 창
          Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    )
                  ]
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: '검색',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
          ),

          //하단 위치 정보 카드
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "정왕동",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'PretendardRegular',), //폰트 나중에 medium으로 바꿔야 함
                  ),
                  const SizedBox(height: 4,),
                  const Text("경기도 시흥시, 대한민국"),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('2°  5° / 4°', style: TextStyle(fontSize: 16)),
                      ElevatedButton(
                          onPressed: (){
                            //TODO:이 앞에 추가 버튼을 누르면 실행될 로직 넣어야 함.
                            Navigator.pop(context); //추가 버튼 클릭시 모달 닫기
                          },
                          child: const Text("추가"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
