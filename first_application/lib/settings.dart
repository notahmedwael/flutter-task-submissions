import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: -50,
            left: -50,
            child: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 100,
            ),
          ),
          const Positioned(
            right: -50,
            bottom: -50,
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 100,
            ),
          ),
          Center(
            child: Container(
              color: Colors.red[800],
              height: 100,
              width: 100,
              child: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
