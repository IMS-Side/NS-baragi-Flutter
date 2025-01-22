import 'package:flutter/material.dart';

class TapBarScreen extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const TapBarScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF4EB5F4), //나중에 색깔 변경
      child: TabBar(
        controller: tabController,
        labelColor: Colors.white, // 탭 선택 시의 글자 색상
        unselectedLabelColor: Colors.white, // 선택되지 않은 탭 텍스트 색상
        indicatorColor: Colors.white, // 선택된 탭 아래 표시자 색상
        //indicator: const BoxDecoration(),
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        tabs: const [
          Tab(text: "날씨"),
          Tab(text: "체감 날씨"),
          Tab(text: "옷 추천"),
          Tab(icon: Icon(Icons.location_on),)
        ],
      ),
    );
  }

  // AppBar의 크기를 설정
  @override
  Size get preferredSize => const Size.fromHeight(48);
}
