import 'package:get/get.dart';
import 'package:nsbaragi/apparent_weather/services/statisticService.dart';
import 'package:nsbaragi/apparent_weather/services/weatherService.dart';

class ApparentWeatherController extends GetxController {

  final StatisticService statisticService = StatisticService();
  final WeatherService weatherService = WeatherService();

  // obs로 관리할 Weather 관련 변수
  var location = "로딩 중...".obs;
  var currentTemp = "".obs;
  var apparentTemp = "".obs;
  var maxTemp = "".obs;
  var minTemp = "".obs;

  // obs로 관리할 Statistic 관련 변수
  var rain = <double>[1.0, 1.0, 1.0, 1.0].obs;
  var humidity = <double>[1.0, 1.0, 1.0, 1.0].obs;
  var sunlight = <double>[1.0, 1.0, 1.0, 1.0].obs;
  var wind = <double>[1.0, 1.0, 1.0, 1.0].obs;
  var cloud = <double>[1.0, 1.0, 1.0, 1.0].obs;

  @override
  void onInit() {
    super.onInit();

    fetchWeather();
    fetchStatistics();

  }

  // Weather 관련 데이터 받아옴
  Future<void> fetchWeather() async {
    print('컨트롤러 : fetchWeather 함수 실행');
    final weatherData = await weatherService.fetchWeather();

    location.value = weatherData["location"];
    currentTemp.value = weatherData["currentTemp"];
    apparentTemp.value = weatherData["apparentTemp"];
    maxTemp.value = weatherData["maxTemp"];
    minTemp.value = weatherData["minTemp"];
  }

  // Statistic 관련 데이터 받아옴
  Future<void> fetchStatistics() async {
    print('컨트롤러 : fetchStatistic 함수 실행');
    final statistics = await statisticService.fetchStatistic();

    rain.value = (statistics["rain"] as List?)?.cast<double>() ?? [1.0, 1.0, 1.0, 1.0];
    humidity.value = (statistics["humidity"] as List?)?.cast<double>() ?? [1.0, 1.0, 1.0, 1.0];
    sunlight.value = (statistics["sunlight"] as List?)?.cast<double>() ?? [1.0, 1.0, 1.0, 1.0];
    wind.value = (statistics["wind"] as List?)?.cast<double>() ?? [1.0, 1.0, 1.0, 1.0];
    cloud.value = (statistics["cloud"] as List?)?.cast<double>() ?? [1.0, 1.0, 1.0, 1.0];

  }

}