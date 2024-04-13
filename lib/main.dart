import 'package:expence_tracker/Widgets/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // appBar: ,
        body: Expenses(),
      ),
    );
  }
}
