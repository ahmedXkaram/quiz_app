import 'package:flutter/material.dart';
import 'models/Question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List questionBank = [
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776.", true),
    Question.name("The Supreme law of the land is the Constitution.", true),
    Question.name(
        "The two rights in the Declaration of Independence are:"
        "  \n Life  "
        "  \n Pursuit of happiness.",
        true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means:\nYou can practice any religion, "
        "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false), //6
    Question.name("We elect a U.S. Representative for 2 years", true),
    Question.name(
        "A U.S. Senator represents all people of the United States", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ " Father of Our Country " \.', false)
  ];
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(builder: (BuildContext) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/flag.png',
                width: 250,
                height: 180,
              ),
              Container(
                margin: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(14.4),
                  border: Border.all(
                    color: Colors.blueGrey.shade400,
                  ),
                ),
                height: 120.0,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[currentQuestionIndex].questionText,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey.shade900),
                    ),
                    onPressed: () => prevQuestion(),
                    child: Icon(Icons.arrow_back),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey.shade900),
                    ),
                    onPressed: () => checkAnswer(true, context),
                    child: Text('TRUE'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey.shade900),
                    ),
                    onPressed: () => checkAnswer(false, context),
                    child: Text('FALSE'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey.shade900),
                    ),
                    onPressed: () => nextQuestion(),
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        );
      }),
    );
  }

  checkAnswer(bool answer, BuildContext context) {
    if (answer == questionBank[currentQuestionIndex].questionAnswer) {
      final snackbar = SnackBar(
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
        content: Text("Correct!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      updateQuestion();
    } else {
      final snackbar = SnackBar(
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
        content: Text("Incorrect!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      updateQuestion();
    }
  }

  prevQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex - 1) % questionBank.length;
    });
  }

  updateQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex + 1) % questionBank.length;
    });
  }

  nextQuestion() {
    updateQuestion();
  }
}
