import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class ExpenseItem extends StatelessWidget{
  final Expense expense;

  const ExpenseItem(this.expense,{super.key});

  @override
  Widget build(context){
    return Card( 
      child:Padding(
        padding: const EdgeInsets.symmetric( 
          vertical: 20,
          horizontal: 10
        ),
        child: Column( 
          children: [ 
            Text(expense.title),
            const SizedBox(height: 10),
            Row( 
              children: [ 
                Text((expense.amount).toString()),
                const Spacer(),
                const Icon( 
                  Icons.alarm
                ),
                const SizedBox(width: 5),
                Text((expense.date).toString())
              ],
            )
          ],
        ),
      ),
    );
  }
}