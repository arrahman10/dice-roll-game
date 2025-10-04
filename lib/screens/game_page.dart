import 'package:flutter/material.dart';

import 'dart:math';

import 'package:dice_roll_game/utils/dice_assets.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int index1 = 0, index2 = 0, diceSum = 0;
  final random = Random.secure();

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
            ElevatedButton(onPressed: rollTheDice, child: const Text('ROLL')),
          ],
        ),
      ),
    );
  }

  void rollTheDice() {
    setState(() {
      index1 = random.nextInt(6);
      index2 = random.nextInt(6);
      diceSum = index1 + index2 + 2;
    });
  }
}
