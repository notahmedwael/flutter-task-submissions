import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 91, 202, 249),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Center(
            child: Text(
              'Welcome To Home Screen',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 2, 2, 100),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}