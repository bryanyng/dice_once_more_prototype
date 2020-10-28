import 'player.dart';
import 'enemy.dart';
import 'dice.dart';
import 'combat.dart';

class Game {
  Player player;
  Enemy enemy;
  DiceBucket dice;

  Combat encounter;
  int numTurns = 0;

  Game() {
    this.player = Player(100);
    this.enemy = Enemy(100);
    this.dice = DiceBucket(100);
    this.encounter = Combat(this.dice, this.player, this.enemy);
  }

  void createNewEncounter() {
    assert(enemy.curHP == 0, 'Enemy has to be defeated first...');
    this.enemy = Enemy(100);
    this.encounter = Combat(this.dice, this.player, this.enemy);
  }
}
