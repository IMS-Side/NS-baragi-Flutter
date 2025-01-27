import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nsbaragi/BackGround.dart';
import 'package:nsbaragi/main_page/sidebar/regionWeather.dart';
import 'main_page/screens/mainPageView.dart';
import 'main_page/tabbar/tabbar.dart';

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
        backgroundColor: Color(0xFF4EB5F4),
        bottom: TabBarScreen(tabController: _tabController),
        //_tabController와 연결
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.location_on))
        ],
      ),
      endDrawer: const Drawer(
        backgroundColor: Color(0xFFE4F1FF),
        child: RegionWeather()
      ),
      body: Background(
          child: TabBarView(
            controller: _tabController,
            children: const [
              MainPageView(),
              //여기에 이제 다른 페이지 추가
              Center(child: Text("체감 날씨 페이지")), // 두 번째 탭
              Center(child: Text("옷 추천 페이지")), // 세 번째 탭
              //Center(child: Text("위치 설정 페이지")), // 네 번째 탭
            ],
          )
      )
    );
  }
}






