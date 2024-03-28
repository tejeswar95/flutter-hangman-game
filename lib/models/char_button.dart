import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman/pages/game.dart';
import 'package:shared_preferences/shared_preferences.dart';

class charButton extends StatelessWidget {
  //const charButton({super.key});
  final String letter;
  final Function(String letter) func;


  charButton({required this.letter,required this.func});

  @override
  Widget build(BuildContext context) {

    final double width=MediaQuery.of(context).size.width/14;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buttons(stringtoList(letter),context,width),
      ),
    );
  }

  List<String> stringtoList(String letters){
    List<String> res=[];
    int len=letters.length;
    for(int i=0;i<len;i++){
      res.add(letters[i]);
    }
    return res;
  }

  List<Widget> buttons(List<String> e,BuildContext context,double width){

    List<Widget> res=[];
    for (final temp in e){
      res.add(Container(
        margin: EdgeInsets.symmetric(horizontal: 3,vertical: 5),
        child: SizedBox(
          width: width,
          height: 50,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(100)),
            child: TextButton(
              onPressed:(){
                func(temp);
              },
              child: Text('$temp',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,),
            ),
          ),
        ),
      ));
    }
    return res;
  }

}
