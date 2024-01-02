import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
  
  final List<Expense> _allExpense = [
    Expense(title: "Fluter course", amount: 499, date: DateTime.now(), category: Category.study),
    Expense(title: "Music system", amount: 2499, date: DateTime.now(), category: Category.leisure),
    Expense(title: "Keyboard", amount: 1499, date: DateTime.now(), category: Category.work),
  ];

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