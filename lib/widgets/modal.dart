import 'package:flutter/material.dart';

class Modal extends StatefulWidget{
  const Modal({super.key});

  @override
  State<Modal> createState() {
    return _Modal();
  }
}

class _Modal extends State<Modal>{
  @override
  Widget build(BuildContext context) {
    return const Padding( 
      padding: EdgeInsets.all(20),
      child: Column( 
        children: [ 
          TextField( 
            maxLength: 25,
            decoration: InputDecoration( 
              label: Text("Title")
            ),
          )
        ],
      ),
    );
  }
}