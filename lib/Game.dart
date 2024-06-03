import 'package:flutter/material.dart';
import 'Globals.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => OnClick(index),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            TicTacToeList[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const Text(
              'Score Board',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Text(
                      'O  ----  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      player1_0.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'X  ----  ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      player2_X.toString(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void OnClick(int index) {
    setState(() {
      if (player1_turn && TicTacToeList[index] == '') {
        TicTacToeList[index] = 'O';
        drawCondition += 1;
      } else if (!player1_turn && TicTacToeList[index] == '') {
        TicTacToeList[index] = 'X';
        drawCondition += 1;
      }
      player1_turn = !player1_turn;
      CheckCondition();
    });
  }

  void CheckCondition() {
    if (TicTacToeList[0] == TicTacToeList[1] &&
        TicTacToeList[0] == TicTacToeList[2] &&
        TicTacToeList[0] != '') {
      GreetingBox(TicTacToeList[0]);
    }
    if (TicTacToeList[3] == TicTacToeList[4] &&
        TicTacToeList[3] == TicTacToeList[5] &&
        TicTacToeList[3] != '') {
      GreetingBox(TicTacToeList[3]);
    }

    if (TicTacToeList[6] == TicTacToeList[7] &&
        TicTacToeList[6] == TicTacToeList[8] &&
        TicTacToeList[6] != '') {
      GreetingBox(TicTacToeList[6]);
    }

    if (TicTacToeList[0] == TicTacToeList[3] &&
        TicTacToeList[0] == TicTacToeList[6] &&
        TicTacToeList[0] != '') {
      GreetingBox(TicTacToeList[0]);
    }

    if (TicTacToeList[1] == TicTacToeList[4] &&
        TicTacToeList[1] == TicTacToeList[7] &&
        TicTacToeList[1] != '') {
      GreetingBox(TicTacToeList[1]);
    }

    if (TicTacToeList[2] == TicTacToeList[5] &&
        TicTacToeList[2] == TicTacToeList[8] &&
        TicTacToeList[2] != '') {
      GreetingBox(TicTacToeList[2]);
    }

    if (TicTacToeList[6] == TicTacToeList[2] &&
        TicTacToeList[6] == TicTacToeList[4] &&
        TicTacToeList[6] != '') {
      GreetingBox(TicTacToeList[6]);
    }

    if (TicTacToeList[0] == TicTacToeList[4] &&
        TicTacToeList[0] == TicTacToeList[8] &&
        TicTacToeList[0] != '') {
      GreetingBox(TicTacToeList[0]);
    } else if (drawCondition == 9) {
      DrawBox();
    }
  }

  void GreetingBox(String win) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Winner : $win'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  RepeatGame();
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again'))
          ],
        );
      },
    );
    if (win == 'O') {
      player1_0++;
    } else if (win == 'X') {
      player2_X++;
    }
    RepeatGame();
  }

  void RepeatGame() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        TicTacToeList[i] = '';
      }
    });
    drawCondition = 0;
  }

  void DrawBox() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Draw'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  RepeatGame();
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again'))
          ],
        );
      },
    );
  }
}