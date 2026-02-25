import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _display = "0";
  String _operator = "";
  double _firstNumber = 0;

  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _display = "0";
        _operator = "";
        _firstNumber = 0;
      } else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        _firstNumber = double.parse(_display);
        _operator = value;
        _display = "0";
      } else if (value == "=") {
        double secondNumber = double.parse(_display);
        double result = 0;

        if (_operator == "+") {
          result = _firstNumber + secondNumber;
        } else if (_operator == "-") {
          result = _firstNumber - secondNumber;
        } else if (_operator == "×") {
          result = _firstNumber * secondNumber;
        } else if (_operator == "÷") {
          result = _firstNumber / secondNumber;
        }

        _display = result.toString();
      } else {
        if (_display == "0") {
          _display = value;
        } else {
          _display += value;
        }
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(text),
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Calculator")),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(_display, style: const TextStyle(fontSize: 40)),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("÷"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("×"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  children: [
                    buildButton("C"),
                    buildButton("0"),
                    buildButton("="),
                    buildButton("+"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

