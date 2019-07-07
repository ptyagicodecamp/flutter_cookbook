List<LexiqueFRSA> listfrsa = [
  LexiqueFRSA("À la prochaine fois !", "Amanaraka !"),
  LexiqueFRSA("abeille", "fandrama"),
  LexiqueFRSA("ablution", "miseky"),
  //....
];

class LexiqueFRSA {
  String frFRSA;
  String saFRSA;

  LexiqueFRSA(String frFRSA, String saFRSA)
  {
    this.frFRSA = frFRSA;
    this. saFRSA = saFRSA;
  }
}