import 'package:first_app/data/questions.dart';
import 'package:first_app/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_app/start_screen.dart';
import 'package:first_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  
/* option number 1 for switching the between the pages
   Widget?activeScreen;

  @override
  void initState() {
    activeScreen =  StartScreen(switchScreen);
    super.initState();
  }



void switchScreen(){
  setState((){
    activeScreen=QuestionScreen();
  });  
} 
  */

   List<String> selectedAnswer=[];






 var activeScreen ='start-screen';

   void switchScreen() {
    setState(() {
       selectedAnswer=[];
       activeScreen = 'question-screen'; 
    });
   
  }
   void  restart(){
      selectedAnswer=[];
    setState(() {
    
      if((selectedAnswer.length)==questions.length){
         selectedAnswer=[];
      }
        activeScreen ='start-screen';
      
    });
      
    }



     void chooseAnswer(answer){
      selectedAnswer.add(answer);
      if((selectedAnswer.length)==questions.length){
         
        setState(() {
           
          activeScreen='result-screen'; 
         
        });
        } 
    }






  @override
  Widget build(context) {

   
   


  
    

 Widget currentscreen=StartScreen(switchScreen);
if(activeScreen=='question-screen'){

currentscreen=QuestionScreen(chooseAnswer);
}

  if(activeScreen=='result-screen'){
    currentscreen=  ResultScreen(back:restart ,choosenanswers:  selectedAnswer,);
 }

 



   /*   option 3 for switching between the pages 
   var activeScreen = 'start-screen';

  void switchScreen() {
    activeScreen = 'question-screen';
  }

   final currentscreen= activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : QuestionScreen();
 */

    return MaterialApp(
      home: Scaffold( 
        appBar: AppBar(
          title: const Center(
            child: Text(
              " Quiz App",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 174, 15, 231),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 37, 18, 71),
              Color.fromARGB(255, 28, 10, 92)
            ]),
          ),
          child:currentscreen,
        ),
      ),
    );
  }
}
