// lib/pages/driver/mygover_driver.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';

class MyGoverDriver extends StatelessWidget {
  final String nom;
  final String prenom;
  final String voiture;
  final String distance;
  final String statut = "En route";
  final int rating = 4;
  final String couleurVehicule = "Noir";
  final String immatriculation = "AB-123-CD";
  final String anneeModele = "2020";

  final LatLng _userPosition = LatLng(48.8566, 2.3522);
  final LatLng _driverPosition = LatLng(48.8606, 2.3376);

  MyGoverDriver({
    super.key,
    required this.nom,
    required this.prenom,
    required this.voiture,
    required this.distance,
  });

  String getEstimatedArrivalTime() {
    final currentTime = DateTime.now();
    final estimatedArrivalTime = currentTime.add(const Duration(minutes: 15));
    return DateFormat('HH:mm').format(estimatedArrivalTime);
  }

  Future<void> showConfirmationDialog(BuildContext context, String action) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Voulez-vous vraiment $action ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirmer'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$prenom $nom'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/driver_placeholder.png'),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$prenom $nom',
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: List.generate(rating, (index) => const Icon(Icons.star, color: Colors.amber, size: 18)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Voiture : $voiture ($couleurVehicule)',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Immatriculation : $immatriculation',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Année : $anneeModele',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: FlutterMap(
              options: MapOptions(
                center: _userPosition,
                zoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: _userPosition,
                      builder: (ctx) => const Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: _driverPosition,
                      builder: (ctx) => const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: [_userPosition, _driverPosition],
                      strokeWidth: 4.0,
                      color: Colors.blueAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Informations supplémentaires",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Heure d'arrivée estimée : ${getEstimatedArrivalTime()}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Distance restante : 2 km",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "Statut : $statut",
                  style: TextStyle(fontSize: 16, color: statut == "En route" ? Colors.green : Colors.orange),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Adresse de départ : 10 Rue de Rivoli",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Adresse d'arrivée : 5 Avenue des Champs-Élysées",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => showConfirmationDialog(context, 'envoyer un message'),
                    icon: const Icon(Icons.message),
                    label: const Text("Message"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => showConfirmationDialog(context, 'appeler le conducteur'),
                    icon: const Icon(Icons.call),
                    label: const Text("Appeler"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
