import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PalavraHomepage extends StatelessWidget {
  const PalavraHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Louvor do Dia'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Hino : "Porque Ele Vive"',
                        textStyle: const TextStyle(
                          fontFamily: 'DancingScript',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                        speed: const Duration(milliseconds: 70),
                        textAlign: TextAlign.center,
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  color: Colors.deepPurple,
                  iconSize: 30,
                  onPressed: () {
                    // Adicione a lógica para tocar a prévia do louvor aqui
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}