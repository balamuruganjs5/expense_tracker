import 'package:expence_tracker/Models/expense.dart';
import 'package:expence_tracker/Widgets/Expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expenses> {
  final List<Expense> expenceData = [
    Expense(
      text: 'Movie ticket',
      price: 150,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      text: 'Breakfast',
      price: 50,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      text: 'Train ticket',
      price: 200,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Chart'),
        Expanded(
          child: ExpencesList(expenceData),
        ),
      ],
    );
  }
}
