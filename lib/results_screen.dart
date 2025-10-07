import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:blitzquiz/data/questions.dart';
import 'package:blitzquiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,
  required this.choosenAnswer,
  required this.onRestart,});

  
  final void Function() onRestart;
  final List<String> choosenAnswer;

  List<Map<String,Object>> getSummaryData(){ //Map like dictionary<key,value>
    final List<Map<String,Object>> summary=[];
    for(var i=0;i<choosenAnswer.length;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':choosenAnswer[i],

      },);
    }

    return summary;

  }


  @override
  Widget build(context){
    final summaryData=getSummaryData();//where() used to filter from list
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((data){
      return data['user_answer']==data['correct_answer'];//it add when both are equal 

    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
       margin: const EdgeInsets.all(40),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('You answered $numCorrectQuestions ouf of $numTotalQuestions questions correctly!',
            style:const TextStyle(
              color: Color.fromARGB(255, 224, 169, 234),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              
            ),
            textAlign: TextAlign.center,),

            const SizedBox(height: 20,),

            QuestionsSummary(summaryData),

            const SizedBox(height: 30,),

            TextButton.icon(onPressed:onRestart, 
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              
            ),
            icon:const Icon(Icons.restart_alt_rounded),
            label:const Text('Resart Quiz!',
            style: TextStyle(
              fontSize: 20,
            ),))
          
        ],),
      ),
    );
  }

}