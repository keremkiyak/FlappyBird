import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flappy_bird_application/bird.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdY = 0;
  double initialPosition = birdY;
  double height = 0;
  double time = 0;
  double gravity = -4.9; //how strong the gravity.
  double velocity = 3.5; //how strong the jump.

  bool gameHasStarted = false;

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      height = gravity * time * time + 30 * time;
      setState(() {
        birdY = initialPosition - height;
      });

      if(birdIsDead()){
        timer.cancel();
        gameHasStarted = false;
      //  _showDialog();

      }

      if (birdY < -1 || birdY > 1) {
        timer.cancel();
      }
      time += 0.01;
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialPosition = birdY;
    });
  }

  bool birdIsDead() {
    if(birdY < -1 || birdY > 1){
      return true;
    }
//check the bird is hitting a barrier. 
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Stack(
                    children: [
                      MyBird(
                        birdY: birdY,
                      ),
                      Container(
                        alignment: Alignment(0, -0.5),
                        child: Text( gameHasStarted? '' : 'T A P  T O  P L A Y',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
