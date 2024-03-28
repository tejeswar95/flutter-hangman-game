import 'package:hangman/pages/game.dart';
import 'package:flutter/material.dart';
import 'package:hangman/pages/gameover.dart';
import 'package:hangman/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>home(),
      '/game':(context)=> game(),
      '/gameover':(context)=>gameover(),
    },
  ));
}
