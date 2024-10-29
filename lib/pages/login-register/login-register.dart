// lib/pages/login-register/login-register.dart
import 'package:flutter/material.dart';
import '../../main.dart';
import 'signup.dart';
import '../user/client_login.dart'; // Import de la page de connexion client
import '../driver/driver_login.dart'; // Import de la page de connexion conducteur

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _navigateToClientLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ClientLoginPage(),
      ),
    );
  }

  void _navigateToDriverLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DriverLoginPage(),
      ),
    );
  }

  void _navigateToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connexion"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Connectez-vous en tant que :",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _navigateToDriverLogin(context),
              child: const Text("Se connecter en tant que Gover"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _navigateToClientLogin(context),
              child: const Text("Se connecter en tant que Client"),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _navigateToSignUp(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.green),
                foregroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text(
                "S'inscrire",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
