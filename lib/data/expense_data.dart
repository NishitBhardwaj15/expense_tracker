import 'package:expense_tracker/model/expense.dart';

class ExpenseData {
 final List<Expense> allExpense = [
    Expense(title: "Fluter course", amount: 499, date: DateTime.now(), category: Category.study),
    Expense(title: "Music system", amount: 2499, date: DateTime.now(), category: Category.leisure),
    Expense(title: "Keyboard", amount: 1499, date: DateTime.now(), category: Category.work),
  ];
}