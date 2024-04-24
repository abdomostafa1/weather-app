import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';

import '../../network/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());

  getWeatherInfo({required String cityName}) async {
    try {
      WeatherModel weatherModel =
      await WeatherService(dio: Dio()).getWeatherInfo(cityName: cityName);
      emit(WeatherInfoLoadedState())
    }
    catch (e) {
      emit(WeatherFailureState())
    }
  }
}
