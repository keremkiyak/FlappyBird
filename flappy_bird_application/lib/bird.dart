import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
 
final birdY;
 MyBird({this.birdY});


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdY),
      
      child: Image.asset('images/bird.jpeg', width: 50),
    );
  }
}