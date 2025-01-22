import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsbaragi/BackGround.dart';
import 'package:nsbaragi/main_page/tapbar/tapbar.dart';
import 'main_page/screens/mainPageView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController; //Tab을 위한 컨트롤러

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0, // 그림자 제거
        backgroundColor: Colors.transparent, // AppBar 배경 투명화
        bottom: TapBarScreen(tabController: _tabController),
        //_tabController와 연결
      ),

      body: Background(
          child: TabBarView(
            controller: _tabController,
            children: const [
              MainPageView(),
              //여기에 이제 다른 페이지 추가
            ],
          )
      )
    );
  }
}






