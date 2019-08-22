import 'dual_word.dart';

List<EnglishToHindi> listfrsa = [
  EnglishToHindi("apple", "सेब"),
  EnglishToHindi("Banana", "केला"),
  EnglishToHindi("Orange", "संतरा"),
  //....
];

class EnglishToHindi implements DualWord{
  String english;
  String hindi;


  EnglishToHindi(String en, String hi)
  {
    this.english = en;
    this.hindi = hi;
  }

  @override
  bool isMatching(String wordPrefix) {
    // TODO: implement isMatching
    return english.startsWith(wordPrefix);
  }

  @override
  String getWord() {
    return this.english;
  }

  @override
  String getOtherWord() {
    // TODO: implement getOtherWord
    return this.hindi;
  }
}
