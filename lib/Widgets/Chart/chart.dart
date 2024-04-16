import 'package:flutter/material.dart';

import 'package:expence_tracker/Models/expense.dart';
import 'package:expence_tracker/Widgets/Chart/chartBar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.work)
    ];
  }

  double get maxExpensevalue {
    double maxExpensevalue = 0;

    for (final expense in buckets) {
      if (expense.totalExpenses > maxExpensevalue) {
        maxExpensevalue = expense.totalExpenses;
      }
    }
    return maxExpensevalue;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(5),
      height: width <= 600 ? 180 : double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.cyan.shade200,
            Colors.cyan.shade50,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    fill: bucket.totalExpenses == 0
                        ? 0
                        : bucket.totalExpenses / maxExpensevalue,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Icon(
                      categoryIcons[bucket.category],
                      color: Colors.cyan.shade400,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
