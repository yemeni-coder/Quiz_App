
import 'package:assignment_2/question_model.dart';
import 'package:flutter/material.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  // here I define the data

  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(155, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Test Your Knowledge",
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontWeight: FontWeight.bold,

            ),
          ),
          _questionWidget(),
          _answerList(),
          nextButton(),
         ],
        ),
      ),
    );
  }





  _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text( "Question ${currentQuestionIndex + 1}/${questionList.length
              .toString()}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
  _answerList(){
    return Column(
      children: questionList[currentQuestionIndex]
          .answerListl
          .map(
              (e) => _answerButton(e),
              )
              .toList(),
    );
  }
  Widget _answerButton (Answer answer){


    bool isSelected = answer==selectedAnswer;




    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 50,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: isSelected ? Colors.green : Colors.grey,
           // backgroundColor: isSelected ? Colors.white : Colors.black,
        ),
        onPressed: () {

          if (selectedAnswer == null){
            if(answer.isCorrect){
              score++;
            }
            setState(() {
              selectedAnswer = answer;
            });
          }
          setState(() {
            selectedAnswer = answer;
          });
        },
      ),
    );
  }



  nextButton(){

    bool isLastQuestion = false;
    if(currentQuestionIndex==questionList.length-1){
      isLastQuestion=true;
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "finish" : "Next Question"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.blueAccent,
          // onPrimary: Colors.white,
        ),
        onPressed: () {
          if(selectedAnswer == null){
            // here is the code to show snackbar that tells user to select an answer

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Please select an answer"),
              ),
            );

          }
          else if(isLastQuestion){

            showDialog(context: context, builder: (_) => showScoreDialog());

            // display score
          }
          else
          {
            //next question
            setState(() {
              currentQuestionIndex++;
              selectedAnswer = null;
            });
          }
        },
      ),
    );
  }

  Widget showScoreDialog(){

    bool isPassed = false;

    if(score >= questionList.length * 0.5){
      //pass if 60%
      isPassed = true;
    }

    String title = isPassed?"Nice work" : "Try again";
    return AlertDialog(
      title: Text(title +" you have $score correct answers out of 6.",
          style: TextStyle(
              color: isPassed ? Colors.green : Colors.redAccent
          )
      ),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          ElevatedButton(
            child: Text("Restart"),
            onPressed: (){
              Navigator.pop(context);
              setState(() {
                currentQuestionIndex = 0;
                score = 0;
                selectedAnswer = null;
              });
            },
          ),

          SizedBox(height: 10),

          ElevatedButton(
            child: const Text("Go back to main page"),
            onPressed: (){
              Navigator.popUntil(context, ModalRoute.withName('/'));


            },
          ),
        ],
      ),
    );
  }



}

