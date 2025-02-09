import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//현재 날씨 & 단기 예보

class Shortweatherservice {

  final String apiKey = dotenv.env['SHORTWEATHER_API_KEY'] ?? ''; // API 키 가져오기

  Future<Map<String, dynamic>?> getWeather(double latitude, double longitude) async {
    final String url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$latitude&lon=$longitude&lang=kr&appid=$apiKey&units=metric";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to load weather data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching weather data: $e");
      return null;
    }
  }

}

