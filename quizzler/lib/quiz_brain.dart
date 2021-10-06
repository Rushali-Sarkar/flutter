import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    // Question("The Big Apple is a nickname given to Washington D.C. in 1971", false),
    // Question("Muddy York is the nickname for New York in winter", false),
    // Question("Peanuts are not nuts", true),
    // Question("People may sneeze or cough while sleeping deeply", false),
    // Question("Copyrights depreciate over time", true),
    // Question("Emu's cannot fly", true),
    // Question("Electron's move faster than the speed of light", false),
    // Question("There is no snow on Minecraft", false),
    // Question("Light travels in a straight line", true),
    // Question("The Mona Liza was stolen from Louvre in 1911", true),
    Question("You can lead a cow down stairs but not up stairs", false),
    Question("Approximately one quarter of the human bones are in the feet", true),
    Question("A slug's blood is green", true),
    Question("Some cats are actually allergic to humans", true),
    Question("Buzz Aldrin's mother's maiden name was \"Moon\"", true),
    Question("It is illegal to pee in the ocean of Portugal", true),
    Question("No pieces of square dry paper can be folded in half more than seven times", false),
    Question("In London UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place", true),
    Question("The loudest sound produced by an animal is 188 decibels. That animal is the African Elephant", false),
    Question("The total surface area of two human lungs is approximately seventy square meters", true),
    Question("Google was originally called \"backrub\"", true),
    Question("Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog", true),
    Question("In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat", true)
  ];

  void reinitialize() {
    _questionNumber = 0;
    return;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }
  int getTotal() {
    return _questionBank.length;
  }

  String getQuestion() {
     return _questionBank[_questionNumber].question;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].answer;
  }
}