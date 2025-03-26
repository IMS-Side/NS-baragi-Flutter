import 'dart:async';

class WeatherService {

  Future<Map<String, dynamic>> fetchWeather() async {

    // API 호출

    // 임시 값
    return {
      "location": "서울",
      "currentTemp": "10°C",
      "apparentTemp": "8°C",
      "maxTemp": "12°C",
      "minTemp": "5°C"
    };
  }

}