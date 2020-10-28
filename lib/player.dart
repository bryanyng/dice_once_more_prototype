class Player {
  int curHP;
  int maxHP;

  Player(int maxHP) {
    this.curHP = maxHP;
    this.maxHP = maxHP;
  }

  int getHit(int dmg) {
    if (this.curHP - dmg < 0) {
      return this.curHP = 0;
    }
    return this.curHP -= dmg;
  }
}
