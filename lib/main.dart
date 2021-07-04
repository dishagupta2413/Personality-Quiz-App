import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main(){
  runApp(MyApp());
}

//We can only extend one class at a time
class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
    // _(underscore) made MyAppState private
  }

}

class _MyAppState extends State<MyApp>{
  var _questionIndex =0;

  void _answerQuestion() {
    //setState is function which take an anonymous function as an argument
    setState(() {
      _questionIndex = _questionIndex +1;
    });
    print('Answer chosen !');
    print(_questionIndex);
  }

  @override
    Widget build(BuildContext context){
    var questions = [
      {'questionText' : 'What\'s your favourite color?', 'answers': [
        'Black', 'Red', 'Green', 'White'
      ],
      },//  A data structure called map is used here{this is shorthand way to crate a map} it can have different keys
      // a string, a list, numbers , anything

      {'questionText' :'What\'s your favourite animal? ' , 'answers': [
        'Rabbit', 'Snake', 'Lion', 'Elephant'
      ],
      },

      {'questionText' :'What\'s your favorite meal?' , 'answers': [
        'Noodles', 'Burger', 'Pasta', 'Pizza'
      ],
      },



    ];
      return MaterialApp(home: Scaffold(
        appBar: AppBar(title: Text('My First Flutter App'),),
        body: Column(children:  [
          Question(
              questions[_questionIndex]['questionText'],
            // second [] are used to access different keys of maps
          ),
          // questions.elementAt(0)
          // in answer 1  we have used anonymous functions
          // RaisedButton(child: Text('Answer 1'),onPressed: () => print('Answer 1 chosen!'),), // here we are going to pass the function's pointer instead of function itself so that flutter is the one who calls the function

          // ... these dots is a spread operator
          // These dots will take a list and will pull all values out of it and add them to the surrounding list
          // as individual values this way we don't add a list to a list but the values of  a list to a list
          // having only one list without a nested list

          ...(questions[_questionIndex]['answers'] as List<String>).map((answer){
            return Answer(_answerQuestion, answer);
          }).toList()

          //.toList() --> is used to show that we want a list not anything else
          // Map don't change the original question list it generate a new list instead
          // based on old list and then we do the transformation in the body of that function that we passed through maps




        ],  
        ),
      ),
      );
      //MaterialApp is another class having named arguments like home
    }
}
