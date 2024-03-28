import 'package:flutter/material.dart';
import 'package:hangman/models/char_button.dart';

class game extends StatefulWidget {
  const game({super.key});

  @override
  State<game> createState() => _gameState();
}

class _gameState extends State<game> {

  static const List<String> keys=["QWERTYUIOP","ASDFGHJKL","ZXCVBNM"];
  String word="";
  String guess ='';
  int count=0;
  List<String> wrongGuess=[];
  bool start=false;

  void initState(){
    super.initState();
    guess=createBlank(word);
    count=1;
    start=true;
  }

  @override
  Widget build(BuildContext context) {

    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    word=arg['word'];
    if(start) {
      guess=createBlank(word);
      start=false;
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('HANGMAN'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: Blanks(guess),
                ),
              ),
            ),
            Expanded(
              flex: 14,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex:2,
                    child: Container(
                      // color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: wrongGuess.map((e)=>Stack(
                            alignment: AlignmentDirectional.center,
                            children:[
                              Text(e,
                                style: TextStyle(fontSize: 40),
                              ),
                              Text('X', style: TextStyle(fontSize: 60,color: Colors.red.withOpacity(0.4)),),
                            ]
                        )).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(),),
                  Expanded(
                    flex: 6,
                    child: Container(
                      child:Image.asset(
                        'assets/$count.png',
                      ),
                      //color: Colors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: keyboard(),
              ),
            ),
          ],
        ),
      );
    }

  Widget keyboard()=>Scaffold(
  //backgroundColor: Colors.purple[900],
  body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: keys.map((e)=>charButton(
    letter: e,
    func:(temp){
      setState(() {
        guess =wordReplacer(guess,checkWord(temp),temp);
      });
    }
  )).toList(),
  ),
  );

  List<Widget> Blanks(String word){
    List<Widget> res=[];
    for(int i=0;i<word.length;i++) {
      res.add(Text(guess[i], style: TextStyle(fontSize: 40,letterSpacing:10),),);
    }
    return res;
  }

  String createBlank(String word){
    String res='';
    for(int i=0;i<word.length;i++){
      res=res+'_';
    }
    return res;
  }

  List<int> checkWord(String temp){
    List<int>res=[];
    for(int i=0;i<word.length;i++){
      if(temp == word[i]){
        res.add(i);
      }
    }
    return res;
  }

  String wordReplacer(String guess,List<int> position,String letter){

    if(position.isEmpty){
      //TODO function for wrong answer
      count+=1;
      wrongGuess.add(letter);
      if(count==5) loseScreen();
      return guess;
    }
    String res=guess;
    for(var temp in position){
      res= (res.substring(0,temp)+letter+res.substring(temp+1));
    }

    if(res==word) winScreen();

    return res;
  }


  void winScreen(){
    Navigator.popAndPushNamed(context, '/gameover',arguments: {'gamestat': true,'count':count});
  }

  void loseScreen(){
    Navigator.popAndPushNamed(context, '/gameover',arguments: {'gamestat': false,'count':count});
  }

}


