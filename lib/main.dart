// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/user/home.dart';
import 'pages/user/inventory.dart';
import 'pages/user/myaccount.dart';

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
        primarySwatch: Colors.green, // Thème principal vert
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green, // Couleur de toutes les AppBars
          foregroundColor: Colors.white, // Texte blanc pour les AppBars
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green, // Couleur des FloatingActionButtons
          foregroundColor:
              Colors.white, // Couleur des icônes des boutons flottants
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.green, // Couleur de fond des ElevatedButtons
            foregroundColor: Colors
                .white, // Couleur du texte et des icônes sur les ElevatedButtons
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.green), // Bordure verte lors du focus
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.grey), // Bordure grise lorsqu'inactif
          ),
          labelStyle:
              TextStyle(color: Colors.green), // Couleur du texte du label
        ),
        iconTheme: const IconThemeData(
            color: Colors.white), // Icônes en blanc par défaut
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
    const MyHomePage(), // Home Page
    Inventory(), // Inventory Page
    const MyAccount(), // Account Page
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
        selectedItemColor: Colors.green, // Couleur de l'icône sélectionnée
        unselectedItemColor:
            Colors.grey, // Couleur des icônes non sélectionnées
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Inventaire'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Mon compte'),
        ],
      ),
      drawer: const Drawer(
        child: Center(child: Text('hello')),
      ),
    );
  }
}
