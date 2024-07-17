import 'package:first_app/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:first_app/summary_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.back, required this.choosenanswers});

  final Function() back;
  final List<String> choosenanswers;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenanswers.length; i++) {
      summary.add({
        'question_index': i,
        'questinons': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenanswers[i]
      });
    }
    return summary;
  }

 

  Widget build(contex) {
final summaryData=getSummary();
final numoftotalquestions=questions.length;
final numofcorrectanswers=summaryData.where((data){
  return data['user_answer']== data['correct_answer'  ];

}).length;






  
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              "you answered questions $numofcorrectanswers out of $numoftotalquestions",
              style:const  TextStyle(color: Colors.white,),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            SummaryScreen(summaryData),
            TextButton(
                onPressed: back,
                child: const Text(
                  "Restart Quiz",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
