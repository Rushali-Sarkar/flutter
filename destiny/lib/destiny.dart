class Option {
  String option1 = "";
  String option2 = "";
  String currentStory = "";
  int storyNumber = 0;
  String background = "";
  int option1Next = 0;
  int option2Next = 0;

  Option(int storyNumber, String background, String currentStory, String option1, String option2, int option1Next, int option2Next) {
    this.currentStory = currentStory;
    this.storyNumber = storyNumber;
    this.background = background;
    this.option1 = option1;
    this.option2 = option2;
    this.option1Next = option1Next;
    this.option2Next = option2Next;
  }
}
