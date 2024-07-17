class QuizQuestions {
  const QuizQuestions(this.text,this.answers);

  final text;
 final List <String> answers;

 List<String> getShuffled(){
  final shuffledlist=List.of(answers);
  shuffledlist.shuffle();
  return shuffledlist;
 }


}