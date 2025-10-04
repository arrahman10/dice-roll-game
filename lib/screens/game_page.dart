import 'package:flutter/material.dart';

import 'dart:math';

import 'package:dice_roll_game/utils/dice_assets.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static const String win = 'You Win!!!';
  static const String lost = 'You Lost!!!';
  String result = '';
  int index1 = 0, index2 = 0, diceSum = 0, target = 0;
  final random = Random.secure();
  bool hasTarget = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DICEROLL')),
      body: Center(
        child: Column(
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
            Text('Dice Sum: $diceSum', style: const TextStyle(fontSize: 25)),
            if (hasTarget)
              Text(
                'Your target: $target\nKeep rolling to match $target',
                style: const TextStyle(fontSize: 27),
              ),
            Text(result, style: const TextStyle(fontSize: 50)),
            ElevatedButton(onPressed: rollTheDice, child: const Text('ROLL')),
            ElevatedButton(onPressed: reset, child: const Text('RESET')),
          ],
        ),
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
      result = win;
    } else if (diceSum == 7) {
      result = lost;
    }
  }

  // Logic to evaluate first roll outcome (win/loss/target)
  void checkFirstRoll() {
    if (diceSum == 7 || diceSum == 11) {
      result = win;
    } else if (diceSum == 2 || diceSum == 3 || diceSum == 12) {
      result = lost;
    } else {
      hasTarget = true;
      target = diceSum;
    }
  }

  // Resets all game state and UI flags
  void reset() {
    setState(() {
      index1 = 0;
      index2 = 0;
      diceSum = 0;
      target = 0;
      result = '';
      hasTarget = false;
    });
  }
}
