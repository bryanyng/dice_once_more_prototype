import 'dart:developer';

import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dice Once More Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('DOM Demo Combat')),
          body: DemoCombat(),
        ));
  }
}

class DemoCombat extends StatefulWidget {
  DemoCombat({Key key}) : super(key: key);

  @override
  _DemoCombatState createState() => _DemoCombatState();
}

class _DemoCombatState extends State<DemoCombat> {
  var game = Game();

  Widget statusBar() {
    return Column(
      children: [
        Text(
          'Turn ' + game.numTurns.toString(),
          style: TextStyle(fontSize: 20),
        ),
        Row(
          children: [
            Text(
              'You: ' +
                  game.player.curHP.toString() +
                  '/' +
                  game.player.maxHP.toString(),
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(width: 30),
            Text(
              'Enemy: ' +
                  game.enemy.curHP.toString() +
                  '/' +
                  game.enemy.maxHP.toString(),
              style: TextStyle(fontSize: 25),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ],
    );
  }

  Widget playerInput() {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              diceBtn(1),
              SizedBox(width: 10),
              diceBtn(2),
              SizedBox(width: 10),
              diceBtn(3)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(height: 10),
          Row(children: [
            diceBtn(4),
            SizedBox(width: 10),
            diceBtn(5),
            SizedBox(width: 10),
            diceBtn(6)
          ], mainAxisAlignment: MainAxisAlignment.center)
        ],
      ),
    );
  }

  Widget diceBtn(int num) {
    var dice = game.dice;
    int numDice = dice.howManyLeft(num);
    return InkWell(
      child: Row(
        children: [
          Container(
            child: Text(dice.getCurDice(num).toString()),
          ),
          Image(
            image: AssetImage('assets/die-' + num.toString() + '.png'),
            width: 50,
          ),
          Container(
            child: Text(numDice.toString()),
          ),
        ],
      ),
      onTap: () {
        setState(() {
          if (!dice.addCurDice(num)) {
            log('Cannot choose more than ' +
                dice.maxCurDice.toString() +
                ' now!!');
          }
        });
      },
    );
  }

  Widget executeBtn() {
    return RaisedButton(
      child: Text('Execute'),
      color: Colors.blue,
      onPressed: () {
        setState(() {
          assert(game.enemy.curHP > 0, 'Stop hitting the dead enemy...');
          game.encounter.execute();
        });
      },
    );
  }

  Widget resetDiceBtn() {
    var dice = game.dice;
    return RaisedButton(
      child: Text('Reset Dice'),
      onPressed: () {
        setState(() {
          dice.resetCurDice();
        });
      },
    );
  }

  Widget resetGameBtn() {
    return RaisedButton(
      child: Text('Reset Game'),
      color: Colors.red,
      onPressed: () {
        setState(() {
          game = Game();
        });
      },
    );
  }

  Widget nextBtn() {
    return RaisedButton(
      child: Text('Next Battle!'),
      color: Colors.green,
      onPressed: () {
        setState(() {
          game.createNewEncounter();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          statusBar(),
          SizedBox(height: 10),
          playerInput(),
          executeBtn(),
          resetDiceBtn(),
          resetGameBtn(),
          nextBtn()
        ],
      ),
    );
  }
}
