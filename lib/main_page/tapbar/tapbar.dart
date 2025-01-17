import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapBar extends StatefulWidget {
  const TapBar({super.key});

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> with SingleTickerProviderStateMixin {

  late TabController tabController = TabController(
    length: 3, vsync: this, initialIndex: 0,

    // 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 800),
  );

  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TapBarScreen"),
      ),
      body: _tapBar(), //tapbar 적용
    );
  }

  //만약 속성 변경(스타일 변경을 하고 싶다면) 여기에서
  Widget _tapBar(){
    return TabBar(
      controller: tabController,
      labelColor: Colors.black, //나중에 white로 바꿔야함.
      labelStyle: const TextStyle(
        fontSize: 12,
        //추가 폰트 작업은 추후 여기에서 
      ),
      tabs: const [
        Tab(text: "날씨"),
        Tab(text: "체감 날씨"),
        Tab(text: "옷 추천"),
      ],
    );
  }


}
