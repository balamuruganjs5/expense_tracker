import 'package:expence_tracker/Models/expense.dart';
import 'package:expence_tracker/Widgets/Expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpencesList extends StatelessWidget {
  ExpencesList(this.expenseData, {super.key, required this.removeExpense});

  final List<Expense> expenseData;
  void Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseData.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenseData[index]),
        onDismissed: (direction) {
          removeExpense(expenseData[index]);
        },
        child: ExpenseItem(
          expenseData[index],
        ),
      ),
    );
  }
}
