import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton(this.text, this.ontap, {super.key});

  final text;
  void Function() ontap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 174, 15, 231),
      ),
      child: Text(text),
    );
  }
}
