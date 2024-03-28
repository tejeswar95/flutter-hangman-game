import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  late TextEditingController guessCtrl;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    guessCtrl=TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    guessCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("") ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        const Text("HANGMAN",style: TextStyle(fontSize: 40),),
            Expanded(flex: 5,child: Image.asset('assets/1.png'),),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller: guessCtrl,decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter a word",
              ),
              ),
            ),
            Container(color:Colors.grey[400],
                child: TextButton(onPressed: (){
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  Navigator.pushNamed(context, '/game',arguments: {
                    'word':guessCtrl.text.toUpperCase(),
                  });
                },
                  child: const Text("START",style: TextStyle(fontSize: 30,color: Colors.black),),
                )
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
