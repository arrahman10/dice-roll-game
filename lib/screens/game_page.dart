import 'dart:math';

import 'package:flutter/material.dart';

import 'package:dice_roll_game/models/game_status.dart';
import 'package:dice_roll_game/screens/start_page.dart';
import 'package:dice_roll_game/utils/dice_assets.dart';
import 'package:dice_roll_game/widgets/dice_button.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static const String winMessage = 'You Win!!!';
  static const String loseMessage = 'You Lost!!!';
  GameStatus gameStatus = GameStatus.none;
  String result = '';
  int index1 = 0, index2 = 0, diceSum = 0, target = 0;
  final random = Random.secure();
  bool hasTarget = false, shouldShowBoard = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DICEROLL')),
      body: Center(
        child: shouldShowBoard
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(diceList[index1], width: 100, height: 100),
                      const SizedBox(width: 10),
                      Image.asset(diceList[index2], width: 100, height: 100),
                    ],
                  ),
                  Text(
                    'Dice Sum: $diceSum',
                    style: const TextStyle(fontSize: 25),
                  ),
                  if (hasTarget)
                    Text(
                      'Your target: $target\nKeep rolling to match $target',
                      style: const TextStyle(fontSize: 27),
                    ),
                  // Show result text only when game is over
                  if (gameStatus == GameStatus.over)
                    Text(result, style: const TextStyle(fontSize: 50)),
                  // Show roll button only during running game
                  if (gameStatus == GameStatus.running)
                    DiceButton(onPressed: rollTheDice, label: 'ROLL'),
                  // Show reset button only when game is over
                  if (gameStatus == GameStatus.over)
                    DiceButton(onPressed: reset, label: 'RESET'),
                ],
              )
            : StartPage(onStart: showGameBoard),
      ),
    );
  }

  // Handles dice roll and updates dice images and sum
  void rollTheDice() {
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      diceSum = index1 + index2 + 2;
      if (hasTarget) {
        checkTarget();
      } else {
        checkFirstRoll();
      }
    });
  }

  // Checks win/loss on target matching after first roll
  void checkTarget() {
    if (diceSum == target) {
      result = winMessage;
      gameStatus = GameStatus.over;
    } else if (diceSum == 7) {
      result = loseMessage;
      gameStatus = GameStatus.over;
    }
  }

  // Logic to evaluate first roll outcome (win/loss/target)
  void checkFirstRoll() {
    if (diceSum == 7 || diceSum == 11) {
      result = winMessage;
      gameStatus = GameStatus.over;
    } else if (diceSum == 2 || diceSum == 3 || diceSum == 12) {
      result = loseMessage;
      gameStatus = GameStatus.over;
    } else {
      hasTarget = true;
      target = diceSum;
    }
  }

  // Resets all game state and UI flags
  void reset() {
    setState(() {
      resetGameState();
    });
  }

  void resetGameState() {
    index1 = 0;
    index2 = 0;
    diceSum = 0;
    target = 0;
    result = '';
    hasTarget = false;
    shouldShowBoard = false;
    gameStatus = GameStatus.none;
  }

  void showGameBoard() {
    setState(() {
      shouldShowBoard = true;
      gameStatus = GameStatus.running;
    });
  }
}
