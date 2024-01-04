import 'package:expense_tracker/widgets/modal.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_list.dart';

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

   void _openModal(){
    showModalBottomSheet(context: context, builder: (ctx){
      return Modal(addNewExpense);
    });
  }

  void addNewExpense(Expense expense){
   setState(() {
     _allExpense.add(expense);
   });
  }

  @override
  Widget build(context){
    return Scaffold(
      appBar: AppBar( 
        title: const Text("ExpenseTracker"),
        actions: [ 
          IconButton( 
            onPressed: _openModal,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [ 
          Expanded(
            child: ExpenseList(allExpense: _allExpense)
          )
        ],
      ),
    );
  }

}