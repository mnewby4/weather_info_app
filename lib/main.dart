import 'dart:math';
import 'package:flutter/material.dart';

//Reads the user's input
TextEditingController text1 = TextEditingController ();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Initializes the weather information
  String _cityName = "";
  int _temperature = 0;
  String _condition = "";
  List<String> weatherOptions = ["sunny", "cloudy", "rainy"];

  //Sets the weather information
  void _fetchWeather() {
    setState(() {
      _cityName = text1.text;
      _temperature = Random().nextInt(15) + 15;
      _condition = weatherOptions[Random().nextInt(weatherOptions.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Input cityName
            TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input City Name',
                ),
                controller: text1,
            ),
            //Displays the weather data
            Text(
              '\n' + _cityName + '\n\n' + '$_temperature' + 'F' + '\n\n' + _condition + '\n', 
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            //Fetch Weather data button
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'))
          ],
        ),
      ),
    );
  }
}
