import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';

import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    log(weatherModel.image);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: getWeatherColor(weatherModel.weatherCondition).toList(),
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.city,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherModel.time.hour}:${weatherModel.time.minute}',
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weatherModel.image.contains('https:')
                      ? weatherModel.image
                      : 'https:${weatherModel.image}',
                  width: 100.0,
                  height: 100.0,
                ),
                const Text(
                  '17',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherModel.maxTemp}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherModel.minTemp}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on MaterialColor {
  List<Color> toList(){
    return [
      this[500]!,
      this[400]!,
      this[300]!,
      this[200]!,
      this[100]!,
    ];
  }
}

