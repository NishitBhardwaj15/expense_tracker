import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';

class ExpenseList extends StatelessWidget{
  final List<Expense> allExpense;

  const ExpenseList({super.key, required this.allExpense});

  @override
  Widget build(context){
    return ListView.builder(
      itemCount: allExpense.length,
      itemBuilder: (context, index){
        return ExpenseItem(allExpense[index]);
      },
    );
  }
}