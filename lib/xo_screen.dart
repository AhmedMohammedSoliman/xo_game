import 'package:flutter/material.dart';
import 'package:xo_secion/buttonWidget.dart';

class XO_Screen extends StatefulWidget {
  static const String routeName = "XO SCREEN";

  @override
  State<XO_Screen> createState() => _XO_ScreenState();
}

class _XO_ScreenState extends State<XO_Screen> {
  List <String> texts = [
    "" , "" , "",
    "" , "" , "",
    "" , "" , "",
  ];
  int scorePlayer1 = 0 ;
  int scorePlayer2 = 0 ;


   @override
  Widget build(BuildContext context) {
   var args = ModalRoute.of(context)?.settings.arguments as Map ;
    return Scaffold(
      appBar: AppBar (
        title: Text ("XO Game"),
        centerTitle: true,
      ),
      body: Column (
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${args["player1"]}(X)" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),) ,
                    Text("$scorePlayer1" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${args["player2"]}(O)" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),) ,
                    Text("$scorePlayer2" , style: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: ButtonWidget(text: "${texts[0]}", index: 0 ,onButtonClick: onDigitClick ,)
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child:ButtonWidget(text: "${texts[1]}", index: 1 ,onButtonClick: onDigitClick )
                  )
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: ButtonWidget(text: "${texts[2]}", index: 2 ,onButtonClick: onDigitClick )
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: ButtonWidget(text: "${texts[3]}",index: 3 ,onButtonClick: onDigitClick )
                  ),
                ),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child:ButtonWidget(text: "${texts[4]}",index: 4 ,onButtonClick: onDigitClick )
                    )
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: ButtonWidget(text: "${texts[5]}",index: 5 ,onButtonClick: onDigitClick )
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: ButtonWidget(text: "${texts[6]}",index: 6 ,onButtonClick: onDigitClick )
                  ),
                ),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child:ButtonWidget(text: "${texts[7]}",index: 7 ,onButtonClick: onDigitClick )
                    )
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: ButtonWidget(text: "${texts[8]}",index: 8 ,onButtonClick: onDigitClick )
                  ),
                ),

              ],
            ),
          ),
        ]
      ),
    );
  }

  int counter = 0 ;

  void onDigitClick (int index){
   if (texts[index].isNotEmpty){
     return ;
   }
      if(counter % 2 == 0){
        texts[index] = "X" ;
      }else {
        texts[index] = "O" ;
      }
       counter ++ ;
      setState((){
        if (checkWinner("X")){
          scorePlayer1 += 5 ;
          showialogPlayer1();
          texts = ["" , "" , "" , "" , "" , "" ,"" , "" , ""];
          counter = 0 ;
        }else if (checkWinner("O")){
          scorePlayer2 += 5 ;
          showialogPlayer2();
          texts = ["" , "" , "" , "" , "" , "" ,"" , "" , ""];
          counter = 0 ;
        }
        else if (counter == 9){
          texts = ["" , "" , "" , "" , "" , "" ,"" , "" , ""];
        }

      });
  }
  bool checkWinner (String  symbol){
    if (texts[0] == symbol &&texts[1] == symbol && texts [2] == symbol){
      return true ;
    }else if (texts[3] == symbol && texts [4] == symbol && texts[5] == symbol){
      return  true ;
    }else if (texts[3] == symbol && texts [4] == symbol && texts[5] == symbol){
      return  true ;
    }else if (texts[6] == symbol && texts [7] == symbol && texts[8] == symbol){
      return  true ;
    }else if (texts[0] == symbol && texts [3] == symbol && texts[6] == symbol){
      return  true ;
    }else if (texts[1] == symbol && texts [4] == symbol && texts[7] == symbol){
      return  true ;
    }else if (texts[2] == symbol && texts [5] == symbol && texts[8] == symbol){
      return  true ;
    }else if (texts[0] == symbol && texts [4] == symbol && texts[8] == symbol){
      return  true ;
    }else if (texts[2] == symbol && texts [4] == symbol && texts[6] == symbol){
      return  true ;
    }else {
      return false ;
    }
  }
  void showialogPlayer1 (){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Player 1 is Winner !"),
        ));
    setState((){});
  }
  void showialogPlayer2 (){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Player 2 is Winner !"),
        ));
    setState((){});
  }
}