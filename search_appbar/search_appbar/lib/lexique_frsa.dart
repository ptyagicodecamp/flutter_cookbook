import 'dual_word.dart';

List<LexiqueFRSA> listfrsa = [
  LexiqueFRSA("À la prochaine fois !", "Amanaraka !"),
  LexiqueFRSA("abeille", "fandrama"),
  LexiqueFRSA("ablution", "miseky"),
  //....
];

class LexiqueFRSA implements DualWord{
  String frFRSA;
  String saFRSA;


  LexiqueFRSA(String frFRSA, String saFRSA)
  {
    this.frFRSA = frFRSA;
    this.saFRSA = saFRSA;
  }

  @override
  bool isMatching(String wordPrefix) {
    // TODO: implement isMatching
    return frFRSA.startsWith(wordPrefix);
  }

  @override
  String getWord() {
    return this.frFRSA;
  }

  @override
  String getOtherWord() {
    // TODO: implement getOtherWord
    return this.saFRSA;
  }
}
