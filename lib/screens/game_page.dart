import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DICEROLL')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/images/d5.png')],
        ),
      ),
    );
  }
}
