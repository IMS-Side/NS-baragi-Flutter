import 'package:flutter/material.dart';
import '../widgets/dayWeatherCard.dart';
import '../services/shortWeatherService.dart';
import 'package:nsbaragi/main_page/services/locationService.dart';



class  DayWeather extends StatefulWidget {
  const DayWeather({super.key});

  @override
  State<DayWeather> createState() => _DayWeatherState();
}

class _DayWeatherState extends State<DayWeather> {
  final Shortweatherservice shortweatherservice = Shortweatherservice();
  final LocationService locationService = LocationService();
  List<dynamic> weatherData = []; // 시간별 날씨 데이터 저장
  String weatherMessage = "날씨 정보 가져오는 중...."; // 동적 메시지 문구

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  //날씨 데이터 가져오기
  Future<void> fetchWeather() async {
    final position = await locationService.getCurrentLocation(); //현재위치
    if (position != null) {
      final weather = await shortweatherservice.getWeather(
          position.latitude, position.longitude); // 현재 위치로 날씨 가져오기

      if (weather != null && weather["hourly"] != null) {
        List<dynamic> hourlyData = weather["hourly"]; // 시간별 날씨 데이터

        // 현재 시간을 Unix timestamp로 변환
        int now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

        // 현재 시간과 가장 가까운 데이터 찾기
        int closestIndex = 0;
        for (int i = 0; i < hourlyData.length; i++) {
          if (hourlyData[i]['dt'] > now) {
            closestIndex = (i > 0) ? i - 1 : 0; // 이전 시간 데이터 포함
            break;
          }
        }
        // 현재 날씨 상태 가져오기
        String currentWeather = hourlyData[closestIndex]['weather'][0]['main'];

        // 날씨 상태에 따른 메시지 설정
        String newWeatherMessage = _getWeatherMessage(currentWeather);

        int endIndex = (closestIndex + 12 > hourlyData.length)
            ? closestIndex + 12
            : hourlyData.length;

        // 현재 시간부터 12시간 후까지의 데이터 가져오기
        if (mounted) {
        setState(() {
          weatherData = hourlyData.sublist(closestIndex, endIndex);
          weatherMessage = newWeatherMessage; //날씨 문구 업데이트
          });
        }
      } else {
            print("날씨 데이터를 가져올 수 없습니다.");
          }
        }
      else {
      print("위치 정보를 가져올 수 없습니다.");
      }
    }

    String _getWeatherMessage(String weather){
    switch (weather){
      case "Clear":
        return "맑은 하늘을 볼 수 있어요";
      case "Clouds":
        return "구름이 조금 있어요";
      case "Snow":
        return "눈이 내려요";
      case "Rain":
        return "비가 오고 있어요";
      default:
        return "날씨 정보 불러오는 중...";
      }
    }

    @override
    Widget build(BuildContext context) {
      return Container(
        width: 392,
        height: 174,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
            color: const Color(0x33467ABE),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Text(weatherMessage,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox( // 일간 날씨 리스트
              height: 116, //위젯 높이
              child: weatherData.isEmpty
                  ? Center(child: CircularProgressIndicator()) // 데이터 로딩 중
                  : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weatherData.length, // 가져온 데이터 개수만큼 반복
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: DayCard(
                      time: weatherData[index]['dt'], // 시간 (Unix 타임스탬프)
                      temp: (weatherData[index]['temp']).toDouble(), // 온도
                      pop: (weatherData[index]['pop']).toDouble(), // 강수확률
                      weather: weatherData[index]['weather'][0]['main'], // 날씨 상태
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
