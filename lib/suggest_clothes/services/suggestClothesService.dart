import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class SuggestClothesService {
  final String baseUrl = dotenv.env['SERVER_URL'] ?? '';

  // 4.1 옷 설문조사 요청
  Future<bool> sendClothes(Map<String, dynamic> requestBody) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/cloth/add'), // 엔드포인트 추가
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody), // JSON 인코딩
      );

      log("서버 응답: ${response.body}", name: "SuggestClothesService");

      if (response.statusCode == 200) {
        return true; // 성공
      } else {
        return false; // 실패
      }
    } catch (e) {
      log("네트워크 오류: $e", name: "SuggestClothesService");
      return false;
    }
  }
}
