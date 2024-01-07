import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  SystemChrome.setPreferredOrientations( [ 
    DeviceOrientation.portraitUp
  ]).then((fn){
    runApp(
    MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.system,
      home:const Expenses()
    )
  );
  });
}


