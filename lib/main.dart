import 'dart:math';
import 'package:flutter/material.dart';

// Reads the user's input
TextEditingController text1 = TextEditingController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  String _cityName = "";
  int _temperature = 0;
  String _condition = "";
  List<String> weatherOptions = ["Sunny", "Cloudy", "Rainy"];
  List<Map<String, dynamic>> _weeklyForecast = [];

  void _fetchWeather() {
    setState(() {
      _cityName = text1.text;
      _temperature = Random().nextInt(15) + 15;
      _condition = weatherOptions[Random().nextInt(weatherOptions.length)];
    });
  }

  void _fetch7DayForecast() {
    setState(() {
      _weeklyForecast = List.generate(7, (index) => {
        "day": "Day ${index + 1}",
        "temperature": Random().nextInt(15) + 15,
        "condition": weatherOptions[Random().nextInt(weatherOptions.length)]
      });
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
            TextField(
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input City Name',
              ),
              controller: text1,
            ),
            Text(
              '\n' + _cityName + '\n\n' + '$_temperature' + 'F' + '\n\n' + _condition + '\n', 
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            ElevatedButton(
              onPressed: _fetch7DayForecast,
              child: const Text('Get 7-Day Forecast'),
            ),
            if (_weeklyForecast.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text(
                '7-Day Weather Forecast:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _weeklyForecast.length,
                  itemBuilder: (context, index) {
                    final day = _weeklyForecast[index];
                    return ListTile(
                      title: Text(day["day"]),
                      subtitle: Text("${day["temperature"]}F, ${day["condition"]}"),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
