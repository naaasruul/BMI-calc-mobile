import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightSliderValue = 170;
  double _weightSliderValue = 170;
  double _result = 0;
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              Text("BMI Calculator",
                  style: TextStyle(fontSize: 60, color: Colors.red)),
              SizedBox(height: 20),
              Image.network(
                "https://www.freeiconspng.com/thumbs/heart-png/heart-png-15.png",
                width: 200,
              ),
              SizedBox(height: 20),
              Text(
                "We care about your health",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text("Height: ${_heightSliderValue.round()} m"),
              SizedBox(height: 20),
              Slider(
                value: _heightSliderValue,
                max: 200,
                label: _heightSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _heightSliderValue = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text("Weight: ${_weightSliderValue.round()} KG"),
              Slider(
                value: _weightSliderValue,
                max: 200,
                label: _weightSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _weightSliderValue = value;
                  });
                },
              ),
              TextButton.icon(
                onPressed: () {
                  var _condition = _result;
                  var _messageTemp = "";
                  if (_condition < 18.5) {
                    _messageTemp = "youre underweight";
                  } else if (_condition < 24.9) {
                    _messageTemp = "Youre normal";
                  } else {
                    _messageTemp = "youre overweight";
                  }
                  setState(() {
                    _result =
                        _weightSliderValue / pow((_heightSliderValue / 100), 2);
                    _message = _messageTemp;
                  });
                  print("Your BMI is :${_result.round()}");
                },
                icon: Icon(Icons.favorite),
                label: Text("Calculate"),
              ),
              _result != 0 ? Text("Your BMI is: ${_result.round()}") :  SizedBox(height: 20), // condition rendering
              Text(_message),
            ],
          ),
        ),
      ),
    );
  }
}
