import 'dual_word.dart';

List<HindiToEnglish> listsafr = [
  HindiToEnglish("सेब", "apple"),
  HindiToEnglish("केला", "Banana"),
  HindiToEnglish("संतरा", "Orange"),
  //....
];

class HindiToEnglish implements DualWord {
  String hindi;
  String english;

  HindiToEnglish(String hi, String en)
  {
    this.hindi = hi;
    this.english = en;
  }

  @override
  String getOtherWord() {
    // TODO: implement getOtherWord
    return this.english;
  }

  @override
  String getWord() {
    // TODO: implement getWord
    return this.hindi;
  }

  @override
  bool isMatching(String wordPrefix) {
    // TODO: implement isMatching
    return this.hindi.startsWith(wordPrefix);
  }
}