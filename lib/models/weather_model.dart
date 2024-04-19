import 'dart:developer';
import 'dart:ffi';


class WeatherModel {
  WeatherModel(
      {required this.city,
      required this.time,
      required this.image,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  final String city;
  final String time;
  final String image;
  final String avgTemp;
  final String maxTemp;
  final String minTemp;
  final String weatherCondition;

  factory WeatherModel.fromJSon(Map<String, dynamic> json) {
    String city = json['location']['name'];
    String time = json['location']['localtime'];
    List<dynamic> forecastDay = json['forecast']['forecastday'];
    Map<String, dynamic> currentDay = forecastDay[0];
    Map<String, dynamic> day = currentDay['day'];
    Double maxTemp = day['maxtemp_c'];
    Double minTemp = day['mintemp_c'];
    Double avgTemp = day['avgtemp_c'];
    String weatherCondition = day['condition']['text'];
    String image = day['condition']['icon'];

    print(maxTemp);
    return WeatherModel(
        city: city,
        time: time,
        image: image,
        avgTemp: "$avgTemp",
        maxTemp: "$maxTemp",
        minTemp: "$minTemp",
        weatherCondition: weatherCondition);
  }
}
