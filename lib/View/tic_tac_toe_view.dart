import 'package:flutter/material.dart';
import 'package:jogodavelha/View/home.dart';
import 'package:jogodavelha/controller/ticTacToeGame.dart';

class TicTacToeView extends StatefulWidget {
  const TicTacToeView({super.key});

  @override
  _TicTacToeViewState createState() => _TicTacToeViewState();
}

class _TicTacToeViewState extends State<TicTacToeView> {

  late TicTacToeGame _game;

  @override
  void initState() {
    super.initState();
    _game = TicTacToeGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
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
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text('Voltar'),
                  ],
                ),
              ),
            ),

          ],
        )
      );

    } else {
      return const Text('');
    }
  }
}


