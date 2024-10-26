// lib/pages/inventory.dart
import 'package:flutter/material.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to the Inventory Page!'),
      ),
    );
  }
}
