import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nsbaragi/BackGround.dart';
import 'package:nsbaragi/apparent_weather/screens/apparentWeatherView.dart';
import 'package:nsbaragi/main_page/sidebar/regionWeather.dart';
import 'package:nsbaragi/suggest_clothes/screens/suggestClothesView.dart';
import 'main_page/screens/mainPageView.dart';
import 'main_page/tabbar/tabbar.dart';
import 'package:intl/date_symbol_data_local.dart'; // 한국어 날자 포맷

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 필수: Flutter 엔진 초기화
  await dotenv.load(fileName: 'assets/config/.env'); //환경 변수 로드

  await initializeDateFormatting('ko_KR', null); // 한국어 날짜 포맷 초기화

  await initializeDateFormatting('ko_KR', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('ko', 'KR'), // 한국어 설정
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
  late TabController _tabController;
  final double _tabBarHeight = 60;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: const Color(0xFFE4F1FF),
        child: RegionWeather(),
      ),
      body: Background(
          child: Stack(
            children: [
              //탭 뷰
              Positioned(
                top: _tabBarHeight,
                left: 0,
                right: 0,
                bottom: 0,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Center(child: MainPageView()),
                    Center(child: ApparentWeatherView()),
                    Center(child: SuggestClothesView()),
                  ],
                ),
              ),
              //탭바
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(top: 15, left: 16, right: 16),
                  child: Row(
                    children: [
                      TabBarScreen(tabController: _tabController),
                      const Spacer(),
                      Builder(
                        builder: (context) {
                          return IconButton( //Icon누르면 Drawer 작동
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: const Icon(Icons.location_on, color: Colors.white, ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
