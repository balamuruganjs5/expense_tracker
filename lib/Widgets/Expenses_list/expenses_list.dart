import 'package:expence_tracker/Models/expense.dart';
import 'package:expence_tracker/Widgets/Expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
        background: Container(
          color: Colors.amber.shade300,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          child: const Text(
            "Delete",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              height: double.infinity,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
