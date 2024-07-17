import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 250, 86, 239),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['questinons'] as String,style:const TextStyle(color: Colors.purple),),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(data['user_answer'] as String, style:const TextStyle(color: Colors.deepOrange),),
                      Text(data['correct_answer'] as String,style:const TextStyle(color: Colors.cyan),)
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
