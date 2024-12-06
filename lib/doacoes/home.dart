import 'package:flutter/material.dart';

class DoacoesHomePage extends StatelessWidget {
  const DoacoesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doações Page'),
      ),
      body: const Center(
        child: Text('Doações Page Content'),
      ),
    );
  }
}