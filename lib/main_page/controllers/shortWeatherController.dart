import 'package:nsbaragi/main_page/services/shortWeatherService.dart';
import 'package:nsbaragi/main_page/services/locationService.dart';
import 'package:get/get.dart';

class ShortWeatherController extends GetxController {
  final Shortweatherservice shortweatherservice = Shortweatherservice();
  final LocationService locationService = LocationService();

  //current
  var weatherDescription = "오늘 날씨 정보를 불러옵니다...".obs; //날씨 상태
  var temperature = "".obs; //현재 온도
  var city = "".obs; //장소
  var tempMax = "".obs; //최고 온도
  var tempMin = "".obs; //최저 온도

  var crnt_uvi = "".obs; //자외선 지수
  var crnt_rain = "".obs; //현재 강수량
  var crnt_rain_1h = "".obs; //강수량, mm/h. 이 매개변수의 측정 단위로 mm/h만 사용할 수 있습니다.
  var crnt_wind_speed = "".obs; //풍속
  var crnt_humidity = "".obs; //습도

  //hourly
  var hour_dt = "".obs; //예측 데이터의 시간 Unix, UTC
  var hour_temp = "".obs; //온도
  var hour_pop = "".obs; //강수 확률
  var hour_weather_main = "".obs; //시간 별 날씨 상태 (2XX, 3XX 등 코드로 구분가능)

  //daily
  var day_temp_min = "".obs; // 최저 온도
  var day_temp_max = "".obs; // 최고 온도
  var day_pop = "".obs; // 강수 확률


  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  //자외선 지수 세기
  void indexUvi(int uvi){
    if(uvi < 3){
      crnt_uvi.value = "낮음";
    }
    else if(uvi < 6){
      crnt_uvi.value = "보통";
    }
    else if(uvi < 8){
      crnt_uvi.value = "높음";
    }
    else if(uvi < 11){
      crnt_uvi.value = "매우 높음";
    }
    else{
      crnt_uvi.value = "위험";
    }
  }

  Future<void> fetchWeather() async{
    final position = await locationService.getCurrentLocation();
    if(position != null){
      final weatherData = await shortweatherservice.getWeather(position.latitude, position.longitude);
      if(weatherData != null){
        weatherDescription.value = weatherData["current"]["weather"][0]["description"];
        temperature.value = "${weatherData["current"]["temp"].round()}°C";
        city.value = "현재 위치"; //추후 추가 예정
        tempMax.value = "${weatherData["daily"][0]["temp"]["max"].round()}°";
        tempMin.value = "${weatherData["daily"][0]["temp"]["min"].round()}°";
        int uvi = weatherData["current"]["uvi"];
        indexUvi(uvi);
      }else{
        weatherDescription.value = "날씨 정보를 가져올 수 없습니다.";
      }
    }else{
      weatherDescription.value = "위치 정보를 가져올 수 없습니다.";
    }
  }

}