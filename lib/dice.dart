import 'dart:math';

class DiceBucket {
  var diceBucket;
  var maxCurDice = 2;
  var curDice = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0};

  DiceBucket(int maxDice) {
    this.diceBucket = Map<int, int>();
    this.diceBucket[1] = 0;
    this.diceBucket[2] = 0;
    this.diceBucket[3] = 0;
    this.diceBucket[4] = 0;
    this.diceBucket[5] = 0;
    this.diceBucket[6] = 0;

    for (int i = 0; i < maxDice; i++) {
      var rng = new Random();
      var rand = rng.nextInt(6) + 1;
      this.diceBucket[rand]++;
    }
  }

  int curTotal() {
    return this.curDice[1] +
        this.curDice[2] +
        this.curDice[3] +
        this.curDice[4] +
        this.curDice[5] +
        this.curDice[6];
  }

  int curDmg() {
    return (1 * this.curDice[1]) +
        (2 * this.curDice[2]) +
        (3 * this.curDice[3]) +
        (4 * this.curDice[4]) +
        (5 * this.curDice[5]) +
        (6 * this.curDice[6]);
  }

  void resetCurDice() {
    this.curDice[1] = 0;
    this.curDice[2] = 0;
    this.curDice[3] = 0;
    this.curDice[4] = 0;
    this.curDice[5] = 0;
    this.curDice[6] = 0;
  }

  bool addCurDice(int num) {
    int curTotal = this.curTotal();
    if (curTotal < this.maxCurDice) {
      this.curDice[num]++;
      return true;
    }
    return false;
  }

  void increaseMaxCurDice() {
    maxCurDice++;
  }

  int getCurDice(int num) {
    return this.curDice[num];
  }

  int howManyLeft(int num) {
    return this.diceBucket[num];
  }

  void useDice() {
    this.curDice.forEach((key, value) {
      if (value >= 1) {
        this.curDice[key]-= value;
        this.diceBucket[key]-= value;
      }
    });
  }
}
