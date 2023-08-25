import 'dart:async';

import 'package:flutter/material.dart';

class MemoryGame extends StatefulWidget {
  const MemoryGame({super.key});

  @override
  _MemoryGameState createState() => _MemoryGameState();
}

class _MemoryGameState extends State<MemoryGame> {
  List<int> itemList = List.generate(10, (index) => index % 5);

  bool isFlipped = false;
  int? firstIndex;
  int? secondIndex;
  bool isGameOver = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Memory Game'),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (!isFlipped && !isGameOver) {
                        setState(() {
                          isFlipped = true;
                          firstIndex = index;
                        });
                      } else if (isFlipped && index != firstIndex && !isGameOver) {
                        setState(() {
                          secondIndex = index;
                        });

                        Timer(Duration(seconds: 1), () {
                          setState(() {
                            if (itemList[firstIndex!] == itemList[secondIndex!]) {
                              itemList[firstIndex!] = -1;
                              itemList[secondIndex!] = -1;
                              if (itemList.every((item) => item == -1)) {
                                isGameOver = true;
                              }
                            }

                            firstIndex = null;
                            secondIndex = null;
                            isFlipped = false;
                          });
                        });
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      color: itemList[index] == -1 ? Colors.grey : Colors.blue,
                      child: Center(
                        child: itemList[index] == -1
                            ? null
                            : isFlipped && (index == firstIndex || index == secondIndex)
                            ? Text('Card ${itemList[index]}')
                            : Text(''),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    if (isGameOver) {
      return Container(
          height: 60,
          color: Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    itemList = List.generate(10, (index) => index % 5);
                    isGameOver = false;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.replay,
                        color: Theme
                            .of(context)
                            .primaryColor,
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
                        color: Theme
                            .of(context)
                            .primaryColor,
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