// lib/pages/inventory.dart
import 'package:flutter/material.dart';
import 'add_object.dart'; // Importez la page d'ajout d'objet

class Inventory extends StatefulWidget {
  Inventory({super.key});

  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  // Liste de données fictives pour l'inventaire
  final List<Map<String, dynamic>> items = [
    {
      "nom": "Chaise en bois",
      "icon": Icons.chair,
      "dimensions": {
        "taille": "40cm x 40cm",
        "hauteur": "90cm",
        "volume": "0.144 m³",
        "poids": "5kg"
      }
    },
    {
      "nom": "Table basse",
      "icon": Icons.table_bar,
      "dimensions": {
        "taille": "120cm x 60cm",
        "hauteur": "45cm",
        "volume": "0.324 m³",
        "poids": "10kg"
      }
    },
    {
      "nom": "Lampe de chevet",
      "icon": Icons.light,
      "dimensions": {
        "taille": "20cm x 20cm",
        "hauteur": "30cm",
        "volume": "0.012 m³",
        "poids": "1kg"
      }
    },
    {
      "nom": "Canapé 3 places",
      "icon": Icons.weekend,
      "dimensions": {
        "taille": "200cm x 80cm",
        "hauteur": "100cm",
        "volume": "1.6 m³",
        "poids": "40kg"
      }
    },
    {
      "nom": "Étagère",
      "icon": Icons.book,
      "dimensions": {
        "taille": "100cm x 30cm",
        "hauteur": "180cm",
        "volume": "0.54 m³",
        "poids": "15kg"
      }
    },
    {
      "nom": "Tapis",
      "icon": Icons.texture,
      "dimensions": {
        "taille": "200cm x 150cm",
        "hauteur": "1cm",
        "volume": "0.003 m³",
        "poids": "2kg"
      }
    },
    {
      "nom": "Télévision",
      "icon": Icons.tv,
      "dimensions": {
        "taille": "100cm x 60cm",
        "hauteur": "5cm",
        "volume": "0.03 m³",
        "poids": "8kg"
      }
    },
    {
      "nom": "Ordinateur portable",
      "icon": Icons.laptop,
      "dimensions": {
        "taille": "35cm x 25cm",
        "hauteur": "2cm",
        "volume": "0.00175 m³",
        "poids": "1.5kg"
      }
    },
    {
      "nom": "Ventilateur",
      "icon": Icons.ac_unit,
      "dimensions": {
        "taille": "30cm x 30cm",
        "hauteur": "50cm",
        "volume": "0.045 m³",
        "poids": "3kg"
      }
    },
    {
      "nom": "Four micro-ondes",
      "icon": Icons.kitchen,
      "dimensions": {
        "taille": "50cm x 30cm",
        "hauteur": "30cm",
        "volume": "0.045 m³",
        "poids": "12kg"
      }
    },
    {
      "nom": "Réfrigérateur",
      "icon": Icons.kitchen,
      "dimensions": {
        "taille": "70cm x 70cm",
        "hauteur": "180cm",
        "volume": "0.882 m³",
        "poids": "60kg"
      }
    },
    {
      "nom": "Machine à laver",
      "icon": Icons.local_laundry_service,
      "dimensions": {
        "taille": "60cm x 60cm",
        "hauteur": "85cm",
        "volume": "0.306 m³",
        "poids": "65kg"
      }
    },
    {
      "nom": "Bureau",
      "icon": Icons.desk,
      "dimensions": {
        "taille": "120cm x 60cm",
        "hauteur": "75cm",
        "volume": "0.54 m³",
        "poids": "20kg"
      }
    },
    {
      "nom": "Chaise de bureau",
      "icon": Icons.chair_alt,
      "dimensions": {
        "taille": "50cm x 50cm",
        "hauteur": "110cm",
        "volume": "0.275 m³",
        "poids": "8kg"
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon inventaire'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(
                item["icon"],
                size: 50,
                color: Colors.grey.shade700,
              ),
              title: Text(
                item["nom"],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Taille : ${item["dimensions"]["taille"]}"),
                    Text("Hauteur : ${item["dimensions"]["hauteur"]}"),
                    Text("Volume : ${item["dimensions"]["volume"]}"),
                    Text("Poids : ${item["dimensions"]["poids"]}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigation vers la page d'ajout d'objet
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddObjectPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
