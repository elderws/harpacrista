import 'package:flutter/material.dart';
import 'package:harpacrista/model/hino_list.dart';
import 'package:harpacrista/model/Hino.dart';
import 'package:harpacrista/harpas/letras_page.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HarpasHomePage extends StatefulWidget {
  const HarpasHomePage({super.key});

  @override
  _HarpasHomePageState createState() => _HarpasHomePageState();
}

class _HarpasHomePageState extends State<HarpasHomePage> {
  late Future<List<Hino>> futureHinos;
  List<String> favoritos = [];

  @override
  void initState() {
    super.initState();
    futureHinos = fetchHinos();
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

  void _addFavorito(String favorito) async {
    if (favoritos.contains(favorito)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('O hino "$favorito" já está na lista de favoritos.')),
      );
      return;
    }

    final shouldAdd = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Adicionar aos Favoritos'),
        content: const Text('Deseja adicionar este hino à lista de favoritos?'),
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

    if (shouldAdd == true) {
      setState(() {
        favoritos.add(favorito);
      });
      _saveFavoritos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harpas'),
      ),
      body: FutureBuilder<List<Hino>>(
        future: futureHinos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Não há harpas disponíveis'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final hino = snapshot.data![index];
                final isFavorito = favoritos.contains(hino.title);
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text('${hino.numero} - ${hino.title}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.info),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LetrasPage(hino: hino),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            isFavorito ? Icons.favorite : Icons.favorite_border,
                            color: isFavorito ? Colors.red : null,
                          ),
                          onPressed: () {
                            _addFavorito(hino.title);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}