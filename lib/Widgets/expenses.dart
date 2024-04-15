import 'package:expence_tracker/Widgets/newExpense.dart';
import 'package:flutter/material.dart';

import 'package:expence_tracker/Models/expense.dart';
import 'package:expence_tracker/Widgets/Expenses_list/expenses_list.dart';
// import 'package:expence_tracker/Widgets/newExpence.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpencesState();
}

class _ExpencesState extends State<Expenses> {
  final List<Expense> expenseData = [
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

  void openBottamSheetOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(addNewExpense: onAddExpense),
      isScrollControlled: true,
      useSafeArea: true,
    );
  }

  void onAddExpense(Expense expense) {
    setState(() {
      expenseData.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      expenseData.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade200,
        title: const Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: openBottamSheetOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpencesList(
              expenseData,
              removeExpense: removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
