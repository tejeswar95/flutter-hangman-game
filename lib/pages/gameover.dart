import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class gameover extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
        appBar: AppBar(title: Text("GAME OVER"),),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 2, child: Image.asset('assets/${arg['count']}.png')),
            Expanded(flex: 1, child: Text(display(arg['gamestat']),style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),),
          ],
        ));
  }

  String display(bool status){
    if(status)  return 'You Have Won';
    else  return 'You have lost';
  }

}
