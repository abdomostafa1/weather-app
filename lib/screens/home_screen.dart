import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const SearchScreen();
              }));
            },
            icon: const Icon(Icons.search),
          )
        ],
        title: const Text('Weather App'),
      ),
      body: const NoWeatherBody(),
    );
  }
}
