// lib/pages/user/add_object.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import de dart:io pour la classe File

class AddObjectPage extends StatefulWidget {
  const AddObjectPage({super.key});

  @override
  _AddObjectPageState createState() => _AddObjectPageState();
}

class _AddObjectPageState extends State<AddObjectPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile; // Pour stocker l'image capturée

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un objet"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Nom de l'objet",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _sizeController,
              decoration: const InputDecoration(
                labelText: "Taille (ex: 40cm x 40cm)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _heightController,
              decoration: const InputDecoration(
                labelText: "Hauteur (ex: 90cm)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _volumeController,
              decoration: const InputDecoration(
                labelText: "Volume (ex: 0.144 m³)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(
                labelText: "Poids (ex: 5kg)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.camera_alt),
                label: const Text("Prendre en photo l'objet"),
                onPressed: _takePhoto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_imageFile != null)
              Center(
                child: Image.file(
                  File(_imageFile!.path),
                  height: 200,
                ),
              ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logique pour sauvegarder l'objet avec les informations entrées
                  final newObject = {
                    "nom": _nameController.text,
                    "dimensions": {
                      "taille": _sizeController.text,
                      "hauteur": _heightController.text,
                      "volume": _volumeController.text,
                      "poids": _weightController.text,
                    },
                    "photo": _imageFile?.path, // Stocke le chemin de la photo
                  };
                  // Naviguer en arrière avec les informations de l'objet
                  Navigator.pop(context, newObject);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Enregistrer"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _sizeController.dispose();
    _heightController.dispose();
    _volumeController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
