// lib/pages/driver/driver_login.dart
import 'package:flutter/material.dart';
import '../driver/driver_home.dart'; // Import de la page d'accueil conducteur

class DriverLoginPage extends StatelessWidget {
  const DriverLoginPage({super.key});

  void _navigateToDriverHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DriverHomePage(), // Page d'accueil conducteur
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion Conducteur"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(
                labelText: "Mot de passe",
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToDriverHome(context),
              child: const Text("Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}
