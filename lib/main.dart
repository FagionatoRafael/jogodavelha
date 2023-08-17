import 'package:flutter/material.dart';
import 'dart:math';
import 'package:jogodavelha/ticTacToeGame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TicTacToeScreen()
    );
  }
}


class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  late TicTacToeGame _game;

  @override
  void initState() {
    super.initState();
    _game = TicTacToeGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _game.play(index);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: _buildSquare(index),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSquare(int index) {
    switch (_game.getSquare(index)) {
      case SquareType.X:
        return const Icon(Icons.clear, size: 72);
      case SquareType.O:
        return const Icon(Icons.circle_outlined, size: 72);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildBottomNavigationBar() {
    if (_game.isGameOver) {
      return Container(
        height: 60,
        color: Colors.black12,
        child: InkWell(
          onTap: () {
            setState(() {
              _game = TicTacToeGame();
            });
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.replay,
                  color: Theme.of(context).primaryColor,
                ),
                Text('Recomeçar'),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Text('');
    }
  }
}



