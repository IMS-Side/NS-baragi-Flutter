import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nsbaragi/suggest_clothes/services/suggestClothesService.dart';

class SuggestClothesController extends GetxController{
  final SuggestClothesService suggestClothesService = SuggestClothesService();

  var selectedClothes = <String, String>{}.obs; //선택한 옷 정보 저장

  void selectClothes(String category, String value){
    selectedClothes[category] = value;
    update();
  }

  Future<void> sendFeelClothes() async {

  }

}