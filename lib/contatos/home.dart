import 'package:flutter/material.dart';

class ContatosHomePage extends StatelessWidget {
  const ContatosHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos Page'),
      ),
      body: const Center(
        child: Text('Contatos Page Content'),
      ),
    );
  }
}