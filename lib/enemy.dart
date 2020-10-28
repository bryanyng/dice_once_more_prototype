class Enemy {
  int curHP;
  int maxHP;

  Enemy(int maxHP) {
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
