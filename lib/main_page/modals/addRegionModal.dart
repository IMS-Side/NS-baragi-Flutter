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
              padding: const EdgeInsets.symmetric(horizontal: 16), // 좌우 패딩만 설정
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: '검색',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14), // 텍스트 중앙 정렬
                  prefixIcon: Icon(Icons.search, size: 20), // 아이콘 크기 조정
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 40, // 아이콘 최소 너비 설정
                  ),
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
                width: 316,
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset : const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "십정동",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'PretendardRegular', //Regular -> Medium
                              ),
                            ),
                            SizedBox(height: 6,),
                            Text(
                              "인천 부평구, 대한민국",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff666666),
                                fontFamily: 'PretendardRegular', //Regular -> Medium
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "2°",
                              style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'PretendardSemiBold', //Regular -> Medium
                              ),
                            ),
                            SizedBox(height: 1,),
                            Text(
                              "5° / 4°",
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff666666),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),

                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          //버튼 클릭 시 카드 추가
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            textStyle: const TextStyle(fontFamily: 'PretendardBold', fontSize: 15,)
                        ),
                        child: const Text("추가"),
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      ),

    );
  }
}
