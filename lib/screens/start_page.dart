import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dice_roll_game/constants/game_rules.dart';
import 'package:dice_roll_game/widgets/dice_button.dart';

class StartPage extends StatelessWidget {
  final VoidCallback onStart;

  const StartPage({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/logo.png', width: 150, height: 150),
        RichText(
          text: TextSpan(
            text: 'DICE',
            style: GoogleFonts.russoOne().copyWith(
              color: Colors.purple,
              fontSize: 40,
            ),
            children: [
              TextSpan(
                text: 'ROLL',
                style: GoogleFonts.russoOne().copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
        const Spacer(),
        DiceButton(onPressed: onStart, label: 'START'),
        DiceButton(
          onPressed: () {
            showInstruction(context);
          },
          label: 'HOW TO PLAY',
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  void showInstruction(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('INSTRUCTION'),
        content: const Text(gameRules),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CLOSE'),
          ),
        ],
      ),
    );
  }
}
