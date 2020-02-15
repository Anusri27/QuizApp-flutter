import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
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
   final question = const [
      {'questiontext':'What is your fav place?',
      'answers':['home','school','hostel','dreamland']
      },
      {'questiontext':'What is your fav clolor?',
      'answers':['White','Blue','Black','Red']
      },
      {'questiontext':'What is your fav animal?',
      'answers':['rabbit','cat','dog','panda']
      }
    ];
   var _qi=0;
  
  void _answerq(){
    setState(() {
      _qi=_qi+1;
    });
    print(_qi);  
    
    if(_qi<question.length)
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
      body:(_qi < question.length) ? Column(children: [
        Question(
          question[_qi]['questiontext']
        ),
        ...(question[_qi]['answers'] as List<String>).map((answer){
          return Answer(_answerq,answer);
        }).toList()
      ]
        
      ): Center(child: Text("You did it!!"),),
      ),
      );
  }
}