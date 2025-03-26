import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AgreeWeatherService{
  final String baseUrl = dotenv.env['SERVER_URL'] ?? '';

  //2.1 현재 날씨 공감 정보 가져오기
  Future<Map<String, dynamic>?> getAgreeStatus(String code) async {

    int admCode = int.parse(code);
    final String url = '$baseUrl/likes/result/$admCode';
    log("$admCode", name: "AgreeWeatherService" );

    try {
      final response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        final Map<String, dynamic>? data = jsonDecode(response.body);

        log("공감 데이터 응답 :  ${jsonEncode(data)}", name: "AgreeWeatherService");
        return data;
      }else{
        log("공감 데이터 API 응답 오류 : ${response.statusCode}", name: "AgreeWeatherService");
      }
    }catch (e) {
      log("getLikeStatus() 오류 발생 : $e", name: "AgreeWeatherService");
    }

    return null;
  }

  //2.2 공감/비공감 전송 API
  Future<void> sendAgreeStatus(String code, int like) async {

    int admCode = int.parse(code);
    final String url = '$baseUrl/likes/add?code=$admCode&likes=$like';
    log("$admCode", name: "AgreeWeatherService" );

    try{
      final response = await http.get(Uri.parse(url));

      if(response.statusCode == 200){
        log("공감률 전송 성공 : $like", name: "AgreeWeatherService" );
      }else{
        log("공감률 전송 실패 : ${response.statusCode}", name: "AgreeWeatherService");
      }
    }catch (e) {
      log("sendAgreeStatus() 오류 발생 : $e", name: "AgreeWeatherService");
    }
  }

}