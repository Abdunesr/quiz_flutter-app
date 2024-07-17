import 'package:first_app/answer_button.dart';
import 'package:first_app/data/questions.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSeclectAnswer,{super.key});


final void Function(String answer) onSeclectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

var questionindex=0;







class _QuestionScreen extends State<QuestionScreen> {

 void pageswitcher(String realAnswer){

 widget.onSeclectAnswer( realAnswer);
  setState(() {
    questionindex++;
  });
 }
 var currentQuestion =questions[questionindex];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            
              // const SizedBox(height: 60,),
              Center(
                
                child: Text(
                  questions[questionindex].text,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                
              ),
               ...questions[questionindex].getShuffled().map((item){
                return AnswerButton(item,(){ pageswitcher(item);
                
                
                    });


                }),


              
            
            ],
          ),
        ),
      ),
    );
  }
}
