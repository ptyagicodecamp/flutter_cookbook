List<LexiqueSAFR> listsafr = [
  LexiqueSAFR("abo", "haut"),
  LexiqueSAFR("adabo", "ficus"),
  LexiqueSAFR("ady", "querelle"),
  //....
];

class LexiqueSAFR {
  String saSAFR;
  String frSAFR;

  LexiqueSAFR(String saSAFR, String frSAFR)
  {
    this.saSAFR = saSAFR;
    this.frSAFR = frSAFR;
  }
}