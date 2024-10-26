// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/inventory.dart';
import 'pages/myaccount.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Liste des pages accessibles depuis le BottomNavigationBar
  final List<Widget> _pages = [
    const MyHomePage(),  // Home Page
    const Inventory(),   // Inventory Page
    const MyAccount(),   // Account Page
  ];

  // Fonction pour gérer le changement de page via le BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Inventaire'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mon compte'),
        ],
      ),
      drawer: const Drawer(
        child: Center(child: Text('hello')),
      ),
    );
  }
}
