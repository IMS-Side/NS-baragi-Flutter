import 'package:flutter/material.dart';
import 'package:nsbaragi/main_page/services/shortWeatherService.dart';
import 'package:nsbaragi/main_page/services/locationService.dart';

class PresentWeather extends StatefulWidget {
  const PresentWeather({super.key});

  @override
  State<PresentWeather> createState() => _PresentWeatherState();
}

class _PresentWeatherState extends State<PresentWeather> {

  String weatherDescrition = "오늘 날씨 정보를 불러옵니다...";
  String temperature = "";
  String city = "";
  String tempMax = "";
  String tempMin = "";

  final Shortweatherservice shortweatherservice = Shortweatherservice();
  final LocationService locationService = LocationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async{
    final position = await locationService.getCurrentLocation();

    if(position != null){
      setState(() async {
        final weatherData = await shortweatherservice.getWeather(position.latitude, position.longitude);
        if(weatherData != null){
          setState(() {
            weatherDescrition =  weatherData["current"]["weather"][0]["description"];
            temperature = "${weatherData["current"]["temp"].round()}°C";
            city = "현재 위치"; //API에 도시 이름이 없음.
            tempMax = "${weatherData["daily"][0]["temp"]["max"].round()}°";
            tempMin = "${weatherData["daily"][0]["temp"]["min"].round()}°";
            //수정 해야함.
          });
        }else{
          setState(() {
            weatherDescrition = "날씨 정보를 가져올 수 없습니다.";
          });
        }
      });
    }else{
      setState(() {
        weatherDescrition = "위치 정보를 가져올 수 없습니다.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _temper(weatherDescrition, temperature, city, tempMax, tempMin),//온도를 나타내는 위젯 호출
        _agreement(), //동의를 나타내는 위젯 호출
      ],
    );
  }
}

Widget _temper(String description, String temp, String city, String tempMax, String tempMin){

  return Column(
        children: [
          SizedBox(height: 24,),
          Text( city ,
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontFamily: 'PretendardSemiBold',
            ),
          ),
          Text( temp,
            style: TextStyle(
                fontSize: 64,
                color: Colors.white,
              fontFamily: 'PretendardRegular',
            ),
          ),
          Text( description,
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              fontFamily: 'PretendardSemiBold',
            ),
          ),
          SizedBox(height: 5,),
          Text("최고: $tempMax 최저: $tempMin",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              fontFamily: 'PretendardSemiBold',
            ),
          ),
          SizedBox(height: 15,),
        ],
  );
}

Widget _agreement(){
  return Column(
        children: [
          const Text("현재 날씨에 동의하나요?",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              fontFamily: 'PretendardRegular',
            ),
          ),
          const SizedBox(height: 5,),
          const Text("10%가 동의해요",
            style: TextStyle(
                fontSize: 10,
                color: Colors.white,
              fontFamily: 'PretendardRegular',
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Row의 children을 가운데 정렬
            children: [
              SizedBox(
                width: 80,
                height: 22,
                child: OutlinedButton(
                  onPressed: () {
                    // 누르면 이벤트 실행
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: const Text(
                    "동의",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'PretendardRegular',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10), // 버튼 간 간격 추가
              SizedBox(
                width: 80,
                height: 22,
                child: OutlinedButton(
                  onPressed: () {
                    // 누르면 이벤트 실행
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: const Text(
                    "비동의",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'PretendardRegular',
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
  );
}
