import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  CounterScreenState createState() => CounterScreenState();
}

class CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Counter: $_counter',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: const Color(0XFF222831),
            onPressed: _incrementCounter,
            child: const Icon(
              Icons.add,
              color: Color(0xFFf2f2f2),
            ),
          ),
          const SizedBox(width: 10), // Add some space between the buttons
          FloatingActionButton(
            backgroundColor: const Color(0XFF222831),
            onPressed: _resetCounter,
            child: const Icon(
              Icons.refresh,
              color: Color(0xFFf2f2f2),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}