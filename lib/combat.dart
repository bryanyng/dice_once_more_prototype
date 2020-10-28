import 'player.dart';
import 'dice.dart';
import 'enemy.dart';

// TEMOPORARY
import 'dart:math';
import 'dart:developer' as dev;

class Combat {
  DiceBucket dice;
  Player player;
  Enemy enemy;

  int numTurns = 0;

  Combat(
    DiceBucket dice,
    Player player,
    Enemy enemy,
  ) {
    this.dice = dice;
    this.player = player;
    this.enemy = enemy;
  }

  void execute() {
    var rng = Random();
    this.numTurns++;

    // Calc Dmg
    var playerDmg = dice.curDmg();
    var enemyDmg = rng.nextInt(13);

    dev.log('Player dealt ' + playerDmg.toString() + ' to Enemy');
    dev.log('Enemy dealt ' + enemyDmg.toString() + ' to Player');

    // Do Dmg
    this.player.getHit(enemyDmg);
    this.enemy.getHit(playerDmg);
    this.dice.useDice();

    if (this.enemy.curHP == 0) {
      dev.log('You have defeated the Enemy!');
    }

    if (this.player.curHP == 0) {
      dev.log('You have died...Press \'Reset Game\' to try again.');
    }
  }
}
