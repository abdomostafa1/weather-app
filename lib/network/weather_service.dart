import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/local.properties.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  WeatherService({required this.dio});

  final Dio dio;

  static const baseUrl='https://api.weatherapi.com/v1';
  Future<WeatherModel> getWeatherInfo(String cityName) async {
    try {
      final response = await dio.get(
          '$baseUrl/forecast.json?days=1&key=$api_key');
      return WeatherModel.fromJSon(response.data);
    } catch (e) {
      throw Exception();
    }
  }
}
