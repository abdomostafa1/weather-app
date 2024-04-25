import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../cubits/weather_cubit/weather_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SearchScreen();
                }));
              },
              icon: const Icon(Icons.search),
            )
          ],
          title: const Text('Weather App'),
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (BuildContext context, state) {
          if (state is NoWeatherState)
            return const NoWeatherBody();
          else if (state is WeatherInfoLoadedState)
            return  WeatherInfoBody(weatherModel: state.weatherModel);
          else
            return Center(
              child: Text('an error occurred try again later'),
            );
        }
    )
    );
  }
  }
