// lib/pages/landing_page.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'login-register/login-register.dart'; // Importez la page de connexion

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // Navigue vers la page de connexion après 3 secondes
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/logo_green.png', // Chemin vers le logo
          width: 150, // Ajustez la taille du logo si nécessaire
        ),
      ),
    );
  }
}
