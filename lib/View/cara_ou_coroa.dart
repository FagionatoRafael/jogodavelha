import 'dart:math';

import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CaraOuCoroa extends StatefulWidget {
  const CaraOuCoroa({super.key});

  @override
  _CaraOuCoroaState createState() => _CaraOuCoroaState();
}

class _CaraOuCoroaState extends State<CaraOuCoroa> {
  final Random random = Random();
  late FlipCardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  void tossCoin() {
    if(random.nextBool()) {
      _controller.state?.toggleCard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara ou Coroa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Resultado:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            FlipCard(
              controller: _controller,
              flipOnTouch: false,
              fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              side: CardSide.FRONT, // The side to initially display.
              front: Card(
                color: Colors.yellowAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    size: 80,
                    Icons.person,
                  ),
                ),
              ),
              back: Card(
                color: Colors.yellowAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    size: 80,
                    Icons.currency_bitcoin,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: tossCoin,
              child: Text('Jogar'),
            ),
          ],
        ),
      ),
    );
  }

}
