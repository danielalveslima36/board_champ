import 'package:flutter/material.dart';
import 'package:teste/pages/ranking.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Ranking(),
    Text(
      'Pareamento',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child:  Text('Board Champ'),),
        backgroundColor: const Color.fromARGB(255, 58, 122, 233),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mediation),
            label: 'Pareamento',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent.shade400,
        onTap: _onItemTapped,
      ),
    );
  }
}