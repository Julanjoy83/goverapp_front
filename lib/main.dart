// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/user/home.dart';
import 'pages/user/inventory.dart';
import 'pages/user/myaccount.dart';
import 'pages/login-register/login-register.dart'; // Chemin correct vers la page de connexion
import 'pages/landing_page.dart'; // Import de la LandingPage

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
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelStyle: TextStyle(color: Colors.green),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      home: const LandingPage(), // Démarrer sur la page de démarrage
    );
  }
}

class MainScreen extends StatefulWidget {
  final String role; // Paramètre de rôle pour déterminer la vue

  const MainScreen({super.key, required this.role});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(),
    Inventory(),
    const MyAccount(),
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
        title: Text(widget.role == "Gover" ? "Gover Dashboard" : "Client Dashboard"),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
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
