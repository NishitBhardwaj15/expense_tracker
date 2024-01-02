import 'package:flutter/material.dart';

class Expense extends StatefulWidget{
  const Expense({super.key});

  @override
  State<StatefulWidget> createState(){
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense>{

  @override
  Widget build(context){
    return const Scaffold(
      body: Column(
        children: [ 
          Text("App bar"),
          Text("Body")
        ],
      ),
    );
  }

}