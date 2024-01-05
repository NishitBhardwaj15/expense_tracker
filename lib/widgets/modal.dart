import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class Modal extends StatefulWidget{
  final void Function(Expense expense) addNewExpense;

  const Modal(this.addNewExpense,{super.key});

  @override
  State<Modal> createState() {
    return _Modal();
  }
}

class _Modal extends State<Modal>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.study;

  void showCalender() async{
    final now = DateTime.now();
    final DateTime oneYearAgo = now.subtract(const Duration(days: 365));
    final pickedDate =  await showDatePicker(context: context, firstDate: oneYearAgo, lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void addExpense(){
    final inputAmount = double.tryParse(_amountController.text);

    bool inputAmountResult = inputAmount == null || inputAmount <= 0;

    if(_titleController.text.trim().isEmpty || inputAmountResult || _selectedDate == null){
      showDialog(context: context, builder: (ctx){
        return AlertDialog( 
          title: const Text("Invalid data entry"),
          content: const Text("Please check whether the expense data entered was correct"),
          actions: [ 
            ElevatedButton(
              onPressed: (){
                Navigator.pop(ctx);
              }, 
              child: const Text("Close")
              )
          ],
        );
      });
    }
    else{
      widget.addNewExpense(Expense(title: _titleController.text, amount: inputAmount, date: _selectedDate!, category: _selectedCategory));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
      child: Column( 
        children: <Widget>[ 
          TextField(
            controller: _titleController, 
            maxLength: 25,
            decoration: const InputDecoration( 
              label: Text("Title")
            ),
          ),
          TextField( 
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration( 
              label: Text("Amount spent")
            ),
          ),
          _selectedDate == null?const Text("Select the date"):Text(formater.format(_selectedDate!)),
          IconButton(
            onPressed: showCalender, 
            icon: const Icon(Icons.calendar_month)
          ),
          DropdownButton(
            value: _selectedCategory,
            items: Category.values.map((category) => DropdownMenuItem( 
              value: category,
              child: Text(category.name.toUpperCase()) 
            ) 
          ).toList(), 
            onChanged: (value){ 
              if(value == null){return;}
              setState(() {
                _selectedCategory = value;
              });
            }
          ),
          Row( 
            children: [ 
              ElevatedButton(
                onPressed: addExpense, 
                child: const Text("Save expense") 
                ),
                OutlinedButton(
                  onPressed: (){ 
                    Navigator.pop(context);
                  }, 
                  child: const Text("Close") 
                  )
            ],
          ),
        ],
      ),
    );
  }
}