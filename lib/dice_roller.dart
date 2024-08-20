import 'dart:math';
import 'package:dice_roller/creats_widgets/my_box.dart';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int _randomNumber1 = 6;

  int _randomNumber2 = 6;
  int _diceSum = 0, _target = 0, _point = 100;
  String _status = "";

  bool _rollButton = true;
  // bool _resetButton = false;
  bool _isGameFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(' Dice Roller'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total point : ${_point}',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                'Dice Sum : ${_diceSum}',
                style: TextStyle(fontSize: 25),
              ),
              Text(
                'Target : ${_target}',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 5,
                  child: MyBox(
                    weight: 200,
                    widget: Image.asset(
                      'assets/images/dice${_randomNumber1}.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

              // SizedBox(width: 10,),
              Expanded(
                child: Card(

                  margin: EdgeInsets.all(20),
                  elevation: 5,
                  child: MyBox(
                    // height: double.infinity,
                    weight: 200,
                    widget: Image.asset(
                      'assets/images/dice${_randomNumber2}.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              ElevatedButton(onPressed: !_isGameFinished ? null : () => Navigator.pop(context), child: Text('Finish'))
              // Text(_status)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: _rollButton ? _diceRoller : null,
                    child: Text('ROLL')),
              ),
              SizedBox(
                width: 30,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: _rollButton || _isGameFinished ? null : _diceReset,
                      child: Text('RESET')))
            ],
          ),
        ),
      ),
    );
  }

  void _diceRoller() {
    setState(() {
      _randomNumber1 = Random().nextInt(6) + 1;
      _randomNumber2 = Random().nextInt(6) + 1;
      _diceSum = _randomNumber1 + _randomNumber2;

      if (_target > 1) {
        if (_target == _diceSum) {
          _status = 'You win the game';
          _point += 100;
          _rollButton = false;
          showDialog(
            useSafeArea:true,
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.red,
              elevation: 5,
              content: Text(
                _status,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
        else if (_diceSum == 7 || _diceSum == 5 || _diceSum == 8) {
          _status = 'You loss the game';
          _point -= 200;
          _rollButton = false;
          _checkPoint();

          showDialog(
            context: context,
            useSafeArea:true,

            builder: (context) => AlertDialog(
              backgroundColor: Colors.red,
              elevation: 5,

              content: Text(
                _status,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      } else {
        if (_diceSum == 7 || _diceSum == 11) {
          _status = 'You win the Game';
          _point += 100;
          _rollButton = false;
          showDialog(
            context: context,
            useSafeArea:true,

            builder: (context) => AlertDialog(
              backgroundColor: Colors.red,
              elevation: 5,

              content: Text(
                _status,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );

          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration:Duration(milliseconds:500),content:Text(_status, style: TextStyle(fontSize: 20),) ));
        } else if (_diceSum == 2 || _diceSum == 3 || _diceSum == 12) {
          _status = 'You lose the game';
          _point -= 200;
          _rollButton = false;
          // _finishButton();
          _checkPoint();
          showDialog(
            context: context,
            useSafeArea:true,

            builder: (context) => AlertDialog(
              backgroundColor: Colors.red,
              elevation: 5,

              content: Text(
                _status,
                style: TextStyle(fontSize: 20),
              ),
            ),
          );

          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration:Duration(milliseconds:500),content: Text(_status, style: TextStyle(fontSize: 20),)));
        } else {
          _target = _diceSum;
        }
      }
    });
  }
  void _diceReset() {
    setState(() {
      _target = 0;
      _diceSum = 0;
      _randomNumber1 = 6;
      _randomNumber2 = 6;
      _rollButton = true;
    });
  }
  void _checkPoint() {
    if(_point == 0) {
      setState(() {
        bool _isGameFinished = true;
      });
    }
  }

  // void _finishButton() {
  //     if( _point == 0){
  //       setState(() {
  //         _resetButton = true;
  //     }
  //   );
  // }}
}
