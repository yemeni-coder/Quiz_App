

class Question {
  final String questionText;
  final List<Answer> answerListl;

  Question(this.questionText, this.answerListl);

}

class Answer {
  final String answerText;
  final bool isCorrect;
 Answer(this.answerText, this.isCorrect);

}

List<Question> getQuestions(){
  List<Question>list = [];

  // this is where I add the questions and answers
list.add(Question(
    "Access to a cloud database through Flutter is available through which service?",
    [Answer("MYSQL", false),
      Answer("NOSQL", false),
       Answer("Firebase Database", true),
        Answer("SQLite", false),
      
    ],));

  list.add(Question(
    "How many types of widgets are there in Flutter?",
    [Answer("8+", false),
      Answer("4", false),
      Answer("6", false),
      Answer("2", true),

    ],));


  list.add(Question(
    "When building for iOS, Flutter is restricted to an __ compilation strategy",
    [Answer("AOT (ahead-of-time)", true),
      Answer("JIT (Just-in-time)", false),
      Answer("Transcompilation ", false),
      Answer(" Recompilation", false),

    ],));



  list.add(Question(
    "A sequence of asynchronous Flutter events is known as a:",
    [Answer("Stream", true),
      Answer("Current", false),
      Answer("Series", false),
      Answer("Flow", false),

    ],));

  list.add(Question(
    "What type of test can examine your code as a complete system?",
    [Answer("Integration Tests", true),
      Answer("Widget tests", false),
      Answer(" Unit tests", false),
      Answer("All of the above", false),

    ],));

  list.add(Question(
    "What element is used as an identifier for components when programming in Flutter?",
    [Answer("Keys", true),
      Answer("Serial", false),
      Answer("Elements", false),
      Answer("Widgets", false),

    ],));




  return list;
}