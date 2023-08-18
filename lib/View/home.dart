import 'package:flutter/material.dart';
import 'package:jogodavelha/View/cara_ou_coroa.dart';
import 'package:jogodavelha/View/tic_tac_toe_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Muitos Jogos'),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TicTacToeView()),),
              child: Text('Jogo da Velha')),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CaraOuCoroa()),),
              child: Text('Cara Ou Coroa'))
        ],
      )
    );
  }
}
