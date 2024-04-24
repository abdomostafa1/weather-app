import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/network/weather_service.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {

  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }

}
