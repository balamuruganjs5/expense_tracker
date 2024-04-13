import 'package:expence_tracker/Models/expense.dart';
import 'package:expence_tracker/Widgets/Expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpencesList extends StatelessWidget {
  const ExpencesList(this.expenseData, {super.key});

  final List<Expense> expenseData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseData.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenseData[index]),
    );
  }
}
