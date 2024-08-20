import 'package:dice_roller/dice_roller.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:(context)=> DiceRoller() ));
        }, child: Text('Start Game')),
      ),
    );
  }
}