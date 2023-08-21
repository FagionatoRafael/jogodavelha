import 'dart:math';

import 'package:flutter/material.dart';

class PedraPapelTesoura extends StatefulWidget {
  const PedraPapelTesoura({super.key});

  @override
  _PedraPapelTesouraState createState() => _PedraPapelTesouraState();
}

class _PedraPapelTesouraState extends State<PedraPapelTesoura> {
  final List<String> choices = ['Pedra', 'Papel', 'Tesoura'];
  String playerChoice = '';
  String computerChoice = '';
  String result = '';

  void playGame(int playerIndex) {
    setState(() {
      playerChoice = choices[playerIndex];
      final Random random = Random();
      final int computerIndex = random.nextInt(3);
      computerChoice = choices[computerIndex];

      if (playerChoice == computerChoice) {
        result = 'Empate!';
      } else if (
      (playerChoice == 'Pedra' && computerChoice == 'Tesoura') ||
          (playerChoice == 'Papel' && computerChoice == 'Pedra') ||
          (playerChoice == 'Tesoura' && computerChoice == 'Papel')
      ) {
        result = 'Você ganhou!';
      } else {
        result = 'Você perdeu!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedra, Papel e Tesoura'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Escolha do jogador: $playerChoice',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Escolha do computador: $computerChoice',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $result',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => playGame(0),
                  child: Text('Pedra'),
                ),
                ElevatedButton(
                  onPressed: () => playGame(1),
                  child: Text('Papel'),
                ),
                ElevatedButton(
                  onPressed: () => playGame(2),
                  child: Text('Tesoura'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
