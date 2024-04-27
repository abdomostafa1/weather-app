import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: const MyMaterialApp(),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
      MaterialColor color = Colors.blue;
      if (state is WeatherInfoLoadedState) {
        color = getWeatherColor(state.weatherModel.weatherCondition);
      }

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: color,
          appBarTheme: AppBarTheme(
            backgroundColor: color,
          ),
        ),
        home: HomeScreen(),
      );
    });
  }
}

MaterialColor getWeatherColor(String weatherCondition) {
  switch (weatherCondition) {
    case "Sunny":
      return Colors.orange;
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
    case "Mist":
    case "Blowing snow":
    case "Blizzard":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Moderate or heavy snow showers":
    case "Moderate or heavy snow with thunder":
    case "Fog":
    case "Freezing fog":
    case "Ice pellets":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.grey;
    case "Patchy rain possible":
    case "Patchy light rain":
    case "Patchy snow possible":
    case "Patchy light snow":
    case "Patchy freezing drizzle possible":
    case "Freezing drizzle":
    case "Light freezing rain":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Light rain shower":
    case "Light sleet showers":
    case "Light snow showers":
    case "Light rain":
    case "Light snow":
    case "Patchy light snow with thunder":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Heavy freezing drizzle":
    case "Moderate or heavy freezing rain":
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Moderate or heavy sleet showers":
      return Colors.blue;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepOrange;

    default:
      return Colors.blue;
  }
}
