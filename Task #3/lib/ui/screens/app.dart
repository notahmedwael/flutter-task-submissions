import 'package:flutter/material.dart';
import 'products_screen.dart';
import 'counter_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductsScreen(),
    CounterScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        title: const Text(
          'Task 3',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFf2f2f2),
          ),
        ),
        backgroundColor: const Color(0xFF393e46),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Counter',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFF96D00),
        backgroundColor: const Color(0XFF393e46),
        unselectedItemColor: const Color(0xFFf2f2f2),
        onTap: _onItemTapped,
      ),
    );
  }
}
