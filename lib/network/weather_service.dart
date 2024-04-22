import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/local.properties.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  WeatherService({required this.dio});

  final Dio dio;

  static const baseUrl = 'https://api.weatherapi.com/v1';

  Future<WeatherModel> getWeatherInfo(String cityName) async {
    try {
      final response =
          await dio.get('$baseUrl/forecast.json?days=1&key=$api_key');
      return WeatherModel.fromJSon(response.data);
    } on DioException catch (e) {
      final errorMessage = e.response?.data['error']['message'] ??
          'there is an error, try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('there is an error, try again later');
    }
  }
}
