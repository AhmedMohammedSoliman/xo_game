import 'package:flutter/material.dart';
import 'package:xo_secion/xo_screen.dart';

class NamesScreen extends StatelessWidget{
  static const String routeName = "NamesScreen" ;
  String playerName1 = "" ;
  String playerName2 = "" ;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar (
       title: Text("Welcome to XO Game"),
       centerTitle: true,
     ),
     body: Padding(
       padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           TextFormField(
             decoration: InputDecoration(
                 hintText: "Enter player 1"
             ),
             onChanged: (text){
               playerName1 = text ;
             },
           ),
           SizedBox(height: 15,),
           TextFormField(
             decoration: InputDecoration(
                 hintText: "Enter player 2"
             ),
             onChanged: (text){
               playerName2 = text ;
             },
           ),
           SizedBox(height: 15,),
           ElevatedButton(
               onPressed: (){
                Navigator.pushNamed(context, XO_Screen.routeName , arguments: {
                  "player1" : playerName1 ,
                  "player2" : playerName2
                } );
               }, child: Text("Let's play"))

         ],
       ),
     ),
   );
  }
}