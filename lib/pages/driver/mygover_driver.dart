// lib/pages/driver/mygover_driver.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart'; // Pour formater l'heure

class MyGoverDriver extends StatelessWidget {
  final String nom;
  final String prenom;
  final String voiture;
  final String distance;

  // Position fictive de l'utilisateur
  final LatLng _userPosition = LatLng(48.8566, 2.3522); // Paris
  // Position fictive du conducteur
  final LatLng _driverPosition = LatLng(48.8606, 2.3376); // Autour de Paris

  MyGoverDriver({
    super.key,
    required this.nom,
    required this.prenom,
    required this.voiture,
    required this.distance,
  });

  // Calcul de l'heure d'arrivée estimée en ajoutant 15 minutes à l'heure actuelle
  String getEstimatedArrivalTime() {
    final currentTime = DateTime.now();
    final estimatedArrivalTime = currentTime.add(const Duration(minutes: 15));
    return DateFormat('HH:mm').format(estimatedArrivalTime); // Format HH:mm
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$prenom $nom'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nom : $prenom $nom',
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Voiture : $voiture',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  'Distance : $distance',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          // Limiter la hauteur de la carte
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: FlutterMap(
              options: MapOptions(
                center: _userPosition,
                zoom: 13.0,
              ),
              children: [
                // Thème par défaut d'OpenStreetMap
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
                // Polyligne entre les deux positions
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
          // Espace pour des informations supplémentaires en dessous, en gras
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Informations supplémentaires",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Estimation de l'heure d'arrivée
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Heure d'arrivée estimée : ${getEstimatedArrivalTime()}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
