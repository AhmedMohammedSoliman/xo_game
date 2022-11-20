import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{
  Function  onButtonClick ;
  String text ;
  int index ;

  ButtonWidget({required this.text ,required this.index, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
         onButtonClick(index);
        }, child: Text("$text" , style: TextStyle(fontSize: 35),));
  }
}