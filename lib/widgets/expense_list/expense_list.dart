import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';

class ExpenseList extends StatelessWidget{
  final List<Expense> allExpense;
  final void Function(Expense expense) removeExpense;

  const ExpenseList(this.removeExpense,{super.key, required this.allExpense});

  @override
  Widget build(context){
    return ListView.builder(
      itemCount: allExpense.length,
      itemBuilder: (context, index){
        return Dismissible(
          key: ValueKey(allExpense[index]),
          onDismissed: (direction) {
            removeExpense(allExpense[index]);
          },
          child: ExpenseItem(allExpense[index]),
          
          );
      },
    );
  }
}