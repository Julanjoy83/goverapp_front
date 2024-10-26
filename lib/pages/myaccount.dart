// lib/pages/myaccount.dart
import 'package:flutter/material.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to My Account Page!'),
      ),
    );
  }
}
