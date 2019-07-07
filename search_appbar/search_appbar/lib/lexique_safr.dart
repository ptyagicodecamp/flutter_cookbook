import 'dual_word.dart';

List<LexiqueSAFR> listsafr = [
  LexiqueSAFR("abo", "haut"),
  LexiqueSAFR("adabo", "ficus"),
  LexiqueSAFR("ady", "querelle"),
  //....
];

class LexiqueSAFR implements DualWord {
  String saSAFR;
  String frSAFR;

  LexiqueSAFR(String saSAFR, String frSAFR)
  {
    this.saSAFR = saSAFR;
    this.frSAFR = frSAFR;
  }

  @override
  String getOtherWord() {
    // TODO: implement getOtherWord
    return this.frSAFR;
  }

  @override
  String getWord() {
    // TODO: implement getWord
    return this.saSAFR;
  }

  @override
  bool isMatching(String wordPrefix) {
    // TODO: implement isMatching
    return this.saSAFR.startsWith(wordPrefix);
  }
}