import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

//We can only extend one class at a time
class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}

class MyAppState extends State<MyApp>{
  var questionIndex =0;

  void answerQuestion() {
    //setState is function which take an anonymous function as an argument
    setState(() {
      questionIndex = questionIndex +1;
    });
    print('Answer chosen !');
    print(questionIndex);
  }

  @override
    Widget build(BuildContext context){
    var questions = [
      'What\'s your favourite color?',
      'What\'s your favourite animal? ',
    ];
      return MaterialApp(home: Scaffold(
        appBar: AppBar(title: Text('My First Flutter App'),),
        body: Column(children:  [
          Text(questions[questionIndex]), // questions.elementAt(0)
          // in answer 1 and 3 we have used anonymous functions
          RaisedButton(child: Text('Answer 1'),onPressed: () => print('Answer 1 chosen!'),), // here we are going to pass the function's pointer instead of function itself so that flutter is the one who calls the function
          RaisedButton(child: Text('Answer 2'),onPressed: answerQuestion,),
          RaisedButton(child: Text('Answer 3'),onPressed: () {
            print('Answer 3 chosen !');
          },),
          RaisedButton(child: Text('Answer 4'),onPressed: answerQuestion,),

        ],  
        ),
      ),
      );
      //MaterialApp is another class having named arguments like home
    }


}