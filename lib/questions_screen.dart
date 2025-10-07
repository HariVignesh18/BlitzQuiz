import 'package:flutter/material.dart';
import 'package:blitzquiz/answer_button.dart';
import 'package:blitzquiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key,required this.onSelectAns});

  final void Function(String answer) onSelectAns;

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex=0;

  void answerQuestion(String selectedAnswers){
    widget.onSelectAns(selectedAnswers);
    setState(() {
      currentQuestionIndex+=1;
      
    });
    
  }


  @override
  Widget build(context){
    final currentQuestion=questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      
      child: Container(
        margin:const  EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: [
          //questions
          Text(currentQuestion.text,
          style:GoogleFonts.lato(
            color:const  Color.fromARGB(255, 216, 213, 222),
            fontSize: 20,
            fontWeight: FontWeight.bold

          ),
          textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30,),
        
            //flutter doesnt allow the children list contains another list
            //...pull the values out side the list and make it a single value
          ...currentQuestion.getShuffledAnswers().map((answer){
            return AnswerButton(answerText:answer, onTap: (){
              answerQuestion(answer);
            },);
          }),
        
          
        
        ],),
      ),
    );
  }
}