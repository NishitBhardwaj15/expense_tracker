import 'package:flutter/material.dart';

class Modal extends StatefulWidget{
  const Modal({super.key});

  @override
  State<Modal> createState() {
    return _Modal();
  }
}

class _Modal extends State<Modal>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.all(20),
      child: Column( 
        children: [ 
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
          Row( 
            children: [ 
              ElevatedButton(
                onPressed: (){
                  print(_titleController.text);
                  print(_amountController.text);
                }, 
                child: const Text("Save expense") 
                ),
                OutlinedButton(
                  onPressed: (){ 
                    Navigator.pop(context);
                  }, 
                  child: const Text("Cancel") 
                  )
            ],
          ),
        ],
      ),
    );
  }
}