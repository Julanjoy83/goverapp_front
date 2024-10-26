// lib/pages/myaccount.dart
import 'package:flutter/material.dart';
import 'inventory.dart'; // Import de la page Inventory

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  // Informations fictives de l'utilisateur
  static const String prenom = "John";
  static const String nom = "Doe";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon compte'),
        centerTitle: true,
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

          // Utilisation de Expanded pour occuper tout l'espace restant
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.inventory),
                  title: const Text("Mon inventaire"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Inventory(),
                      ),
                    );
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
                  leading: const Icon(Icons.message),
                  title: const Text("Messages"),
                  onTap: () {
                    // Navigation vers les messages
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
                    // Action pour la déconnexion
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
