import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nsbaragi/suggest_clothes/services/suggestClothesService.dart';

class SuggestClothesController extends GetxController{
  final SuggestClothesService suggestClothesService = SuggestClothesService();

  var selectedClothes = <String, String>{}.obs;

  void selectFeel(String item, String feel){
    selectedClothes[item] = feel;
    selectedClothes.refresh();
  }

  Future<void> sendFeelClothes() async {

  }

}