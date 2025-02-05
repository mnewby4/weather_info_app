import 'dart:math';

import 'package:flutter/material.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  String _cityName = "";
  int _temperature = 0;
  String _condition = "";
  List<String> weatherOptions = ["sunny", "cloudy", "rainy"];

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  void _fetchWeather() {
    setState(() {
      _cityName = text1.text;
      _temperature = Random().nextInt(15) + 15;
      _condition = weatherOptions[Random().nextInt(weatherOptions.length)];
      print(_cityName + '$_temperature' + _condition);
      //Text('$_condition');     
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input City Name',
                ),
                controller: text1,
            ),
            //Insert display info here once simulation is complete
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'))
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _fetchWeather,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.*/
    );
  }
}
