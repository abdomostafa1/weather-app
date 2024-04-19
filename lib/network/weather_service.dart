import 'package:dio/dio.dart';
import 'package:weather_app/local.properties.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  WeatherService({required this.dio});

  final Dio dio;

  Future<WeatherModel> getWeatherInfo() async {
    try {
      final response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?q=cairo&days=1&key=$api_key');
      Map<String, dynamic> json = response.data;
      final weatherModel= WeatherModel.fromJSon(json);
      print('$weatherModel');
      return weatherModel;
    } catch (e) {
      throw Exception();
    }
  }
}
