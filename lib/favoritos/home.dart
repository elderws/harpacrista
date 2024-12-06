import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FavoritosHomePage extends StatefulWidget {
  const FavoritosHomePage({super.key});

  @override
  _FavoritosHomePageState createState() => _FavoritosHomePageState();
}

class _FavoritosHomePageState extends State<FavoritosHomePage> {
  List<String> favoritos = [];

  @override
  void initState() {
    super.initState();
    _readFavoritos();
  }

  Future<void> _readFavoritos() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/favoritos.txt');
    if (await file.exists()) {
      final contents = await file.readAsString();
      setState(() {
        favoritos = contents.split('\n').where((line) => line.isNotEmpty).toList();
      });
    }
  }

  Future<void> _saveFavoritos() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/favoritos.txt');
    await file.writeAsString(favoritos.join('\n'));
  }

  void _removeFavorito(String favorito) async {
    final shouldRemove = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remover dos Favoritos'),
        content: const Text('Tem certeza que deseja remover este item dos favoritos?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Sim'),
          ),
        ],
      ),
    );

    if (shouldRemove == true) {
      setState(() {
        favoritos.remove(favorito);
      });
      _saveFavoritos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(favoritos[index]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _removeFavorito(favoritos[index]);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}