// lib/pages/user/client_login.dart
import 'package:flutter/material.dart';
import '../user/home.dart'; // Import de la page d'accueil client

class ClientLoginPage extends StatelessWidget {
  const ClientLoginPage({super.key});

  void _navigateToClientHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(), // Page d'accueil client
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion Client"),
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
              onPressed: () => _navigateToClientHome(context),
              child: const Text("Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}
