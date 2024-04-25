
import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class NoWeatherState extends WeatherState{}
class WeatherInfoLoadedState extends WeatherState{
  WeatherInfoLoadedState({required this.weatherModel});

  final WeatherModel weatherModel;
}
class WeatherFailureState extends WeatherState {

  WeatherFailureState ({required this.errorMessage});
  final String errorMessage;
}
