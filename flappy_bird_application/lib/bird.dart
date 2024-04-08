import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
 
final birdY;
final double birdWidth; 
  final double birdHeight;
 MyBird({this.birdY, required this.birdWidth, required this.birdHeight});


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, birdY),
      
      child: Image.asset('images/bird.png', width: 50),
    );
  }
}