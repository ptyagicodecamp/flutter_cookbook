 import 'dart:core';

abstract class DualWord {
    bool isMatching(String wordPrefix);
    String getWord();
    String getOtherWord();
    String toString() {
        return this.getWord();
    }
}