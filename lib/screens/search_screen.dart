import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/network/weather_service.dart';

import '../cubits/weather_cubit/weather_cubit.dart';

WeatherModel? weatherModel;

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
            child: TextField(
          onSubmitted: (value) async {
            final weatherCubit = BlocProvider.of<WeatherCubit>(context);
            weatherCubit.getWeatherInfo(cityName: value);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
            label: const Text('Search'),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            hintText: 'Search City',
            suffixIcon: const Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          ),
        )),
      ),
    );
  }
}
