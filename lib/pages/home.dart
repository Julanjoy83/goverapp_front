// lib/pages/home.dart
import 'package:flutter/material.dart';
import 'driver/mygover_driver.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _arrivalController = TextEditingController();

  bool _showDrivers = false;

  final List<Map<String, String>> _drivers = [
    {
      "nom": "Faye",
      "prenom": "Mouhamadou",
      "voiture": "Renault Clio",
      "distance": "300m"
    },
    {
      "nom": "Ndiaye",
      "prenom": "Jules",
      "voiture": "Lamborghini URUS",
      "distance": "500m"
    },
    {
      "nom": "Alla",
      "prenom": "Amine",
      "voiture": "Cheval",
      "distance": "500 km"
    },
    {
      "nom": "Alfama",
      "prenom": "Anthony",
      "voiture": "à pied",
      "distance": "1500 km"
    },
  ];

  void _submitForm() {
    setState(() {
      _showDrivers = true;
    });
  }

  void _hideDrivers() {
    setState(() {
      _showDrivers = false;
    });
  }

  // Méthode pour naviguer vers la page de détails du conducteur
  void _goToDriverDetails(Map<String, String> driver) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyGoverDriver(
          nom: driver["nom"]!,
          prenom: driver["prenom"]!,
          voiture: driver["voiture"]!,
          distance: driver["distance"]!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Gover'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Entrez les informations de trajet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _departureController,
              decoration: const InputDecoration(
                labelText: 'Lieu de départ',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              onTap: _hideDrivers,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _arrivalController,
              decoration: const InputDecoration(
                labelText: 'Lieu d\'arrivée',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.flag),
              ),
              onTap: _hideDrivers,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Text('Trouver mon gover !'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (_showDrivers) ...[
              const Text(
                "Qui sera votre gover aujourd'hui ?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _drivers.length,
                  itemBuilder: (context, index) {
                    final driver = _drivers[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text('${driver["prenom"]} ${driver["nom"]}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Voiture : ${driver["voiture"]}'),
                            Text('Distance : ${driver["distance"]}'),
                          ],
                        ),
                        onTap: () => _goToDriverDetails(driver),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _departureController.dispose();
    _arrivalController.dispose();
    super.dispose();
  }
}
