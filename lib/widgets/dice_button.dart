import 'package:flutter/material.dart';

class DiceButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DiceButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
      ),
    );
  }
}
