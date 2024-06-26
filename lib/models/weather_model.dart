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
  final DateTime time;
  final String image;
  final String avgTemp;
  final String maxTemp;
  final String minTemp;
  final String weatherCondition;

  factory WeatherModel.fromJSon(Map<String, dynamic> json) {
    String city = json['location']['name'];
    DateTime time = DateTime.parse(json['current']['last_updated']);
    Map<String, dynamic> day = json['forecast']['forecastday'][0]['day'];
    double maxTemp = day['maxtemp_c'];
    double minTemp = day['mintemp_c'];
    double avgTemp = day['avgtemp_c'];
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
