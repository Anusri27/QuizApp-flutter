import 'package:flutter/material.dart';
import 'package:quizapp/result.dart';

import './quiz.dart';
import './result.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
   final _question = const [
      {'questiontext':'What is your fav place?',
      'answers':[{'text':'home','score':10},{'text':'school','score':5},{'text':'hostel','score':8},{'text':'dreamland','score':11}]
      },
      {'questiontext':'What is your fav clolor?',
      'answers':[{'text':'White','score':10},{'text':'Blue','score':5},{'text':'Black','score':15},{'text':'Red','score':1}]
      },
      {'questiontext':'What is your fav animal?',
      'answers':[{'text':'rabbit','score':3},{'text':'cat','score':2},{'text':'dog','score':100},{'text':'panda','score':20}]
      }
    ];
   var _qi=0;
   var  _total=0;

  void _reset(){
    setState(() {
       _qi=0;
       _total=0;
    });
   
  }
  
  void _answerq(int score){
    _total += score;
    
    setState(() {
      _qi=_qi+1;
    });
    print(_qi);  
    
    if(_qi<_question.length)
    {
      print("You hve more left");
    }
    else{
      print("No more questions");
    }
  }
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text("Quiz App") ,
      ) ,
      body:(_qi < _question.length) ? 
      Quiz(answerq: _answerq,question: _question,qi: _qi):
      Result(_total,_reset)
      ),
      );
  }
}