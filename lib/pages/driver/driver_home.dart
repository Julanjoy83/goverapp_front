// lib/pages/driver/driver_home.dart
import 'package:flutter/material.dart';
import 'my_driver_account.dart';
import 'travel_inventory.dart'; // Importez la page de l'inventaire

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  _DriverHomePageState createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> transportRequests = [
    {
      "nom": "Faye",
      "prenom": "Mouhamadou",
      "distance_depart": "300m",
      "destination": "10 Avenue des Champs-Élysées",
      "distance_arrivee": "5 km",
      "prix": "15€",
    },
    {
      "nom": "Ndiaye",
      "prenom": "Jules",
      "distance_depart": "500m",
      "destination": "45 Rue de Rivoli",
      "distance_arrivee": "3 km",
      "prix": "10€",
    },
    {
      "nom": "Alla",
      "prenom": "Amine",
      "distance_depart": "1 km",
      "destination": "25 Boulevard Saint-Michel",
      "distance_arrivee": "7 km",
      "prix": "20€",
    },
    {
      "nom": "Alfama",
      "prenom": "Anthony",
      "distance_depart": "1.5 km",
      "destination": "18 Place de la République",
      "distance_arrivee": "10 km",
      "prix": "25€",
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getSelectedPage() {
    if (_selectedIndex == 1) {
      return const MyDriverAccount();
    }
    return ListView.builder(
      itemCount: transportRequests.length,
      itemBuilder: (context, index) {
        final request = transportRequests[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${request['prenom']} ${request['nom']}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text("Distance du départ : ${request['distance_depart']}"),
                Text("Destination : ${request['destination']}"),
                Text("Distance à l'arrivée : ${request['distance_arrivee']}"),
                Text("Prix de la course : ${request['prix']}"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Action pour accepter la demande de transport
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Accepter la demande"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TravelInventory(
                              nom: request["nom"]!,
                              prenom: request["prenom"]!,
                              items: [
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
                                  "nom": "Armoire",
                                  "icon": Icons.chair,
                                  "dimensions": {
                                    "taille": "100cm x 60cm",
                                    "hauteur": "200cm",
                                    "volume": "1.2 m³",
                                    "poids": "80kg"
                                  }
                                },
                                {
                                  "nom": "Canapé",
                                  "icon": Icons.weekend,
                                  "dimensions": {
                                    "taille": "180cm x 90cm",
                                    "hauteur": "90cm",
                                    "volume": "1.62 m³",
                                    "poids": "50kg"
                                  }
                                },
                                {
                                  "nom": "Tapis",
                                  "icon": Icons.texture,
                                  "dimensions": {
                                    "taille": "200cm x 150cm",
                                    "hauteur": "1cm",
                                    "volume": "0.003 m³",
                                    "poids": "3kg"
                                  }
                                },
                              ],
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Voir l'inventaire"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demandes de transport"),
        backgroundColor: Colors.green,
      ),
      body: _getSelectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: 'Demandes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mon compte'),
        ],
      ),
    );
  }
}
