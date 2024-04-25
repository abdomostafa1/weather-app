import 'dart:developer';

import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key,required this.weatherModel}) : super(key: key);

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    final subTime=weatherModel.time.substring(weatherModel.time.length-6,weatherModel.time.length);
    log(weatherModel.image);

    return Padding(
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
            'updated at $subTime',
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https:${weatherModel.image}',width: 100.0,height: 100.0,),
              const Text(
                '17',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
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
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
