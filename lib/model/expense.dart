import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const  uuid = Uuid();
final formater = DateFormat().add_yMd();

enum Category {leisure,work,study}

const categoryIcon = {
  Category.leisure : Icons.movie_creation_outlined,
  Category.work : Icons.work,
  Category.study : Icons.school_sharp,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4();

  String get formattedDate{
    return formater.format(date);
  }
}
