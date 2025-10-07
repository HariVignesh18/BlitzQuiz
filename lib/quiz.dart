import 'package:flutter/material.dart';
import 'package:blitzquiz/data/questions.dart';
import 'package:blitzquiz/questions_screen.dart';
import 'package:blitzquiz/results_screen.dart';
import 'package:blitzquiz/start_screen.dart';


class Quiz extends StatefulWidget{
  const Quiz({super.key});

  

   @override
  State<Quiz> createState(){
    return _QuizState();
  }
  

}


class _QuizState extends State<Quiz>{
//m1  Widget? activeScreen;

 //m1 @override
 // void initState() {
 //  activeScreen=StartScreen(switchScreen);
 //  super.initState();
  //}

   List<String> selectedAnswers=[]; //get the selected answer 

  var activeScreen='start-screen';

  void switchScreen(){
    setState(() {
      activeScreen='questions-screen';
    });
  }

  void chooseAnswer(String answer){  //add the selected answer to list
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){//to return to main screen after the questions are over
      setState(() {
        
        activeScreen='results-screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen='questions_screen';
    });
  }

  @override
  Widget build(context){
     //m2
    //final screenWidget=activeScreen=='start-screen' 
    // ? StartScreen(switchScreen)
    // :const QuestionsScreen();

    Widget screenWidget=StartScreen(switchScreen);

    if(activeScreen=='questions-screen'){
      screenWidget=QuestionsScreen(
        onSelectAns:chooseAnswer,);
    }

    if(activeScreen=='results-screen'){
      screenWidget= ResultsScreen(
        choosenAnswer:selectedAnswers,
        onRestart:restartQuiz);//for Restart
    }



    return MaterialApp
     (home:Scaffold(
    body:Container(
      decoration: const BoxDecoration(
        gradient:LinearGradient(colors:[Color.fromARGB(255, 221, 106, 5),
        Color.fromARGB(255, 137, 42, 154),
        Colors.purple],
        begin: Alignment.topRight,
        end:Alignment.bottomLeft,)
      ),

      child:screenWidget),
  ));
  }

}