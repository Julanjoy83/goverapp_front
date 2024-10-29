// lib/pages/driver/my_driver_account.dart
import 'package:flutter/material.dart';
import '../login-register/login-register.dart';
import 'driver_home.dart'; // Importez la page DriverHomePage pour y revenir

class MyDriverAccount extends StatelessWidget {
  const MyDriverAccount({super.key});

  // Informations fictives du conducteur
  static const String prenom = "John";
  static const String nom = "Doe";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compte du conducteur'),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Retourne à la page DriverHomePage au lieu de LoginPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DriverHomePage(),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          // Section de l'avatar et du nom
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.grey.shade700,
                ),
                const SizedBox(height: 20),
                const Text(
                  '$prenom $nom',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Divider(), // Ligne de séparation pour le menu

          // Liste des options de compte
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.folder),
                  title: const Text("Mes documents"),
                  onTap: () {
                    // Navigation vers la page "Mes documents"
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text("Historique des voyages"),
                  onTap: () {
                    // Navigation vers la page "Historique des voyages"
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Paramètres"),
                  onTap: () {
                    // Navigation vers la page "Paramètres"
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: const Text("Wallet"),
                  onTap: () {
                    // Navigation vers le wallet
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help),
                  title: const Text("Aide"),
                  onTap: () {
                    // Navigation vers la page "Aide"
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text("Mentions légales"),
                  onTap: () {
                    // Navigation vers les mentions légales
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Se déconnecter"),
                  onTap: () {
                    // Redirection vers la page de connexion
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
