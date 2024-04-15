// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expence_tracker/Models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addNewExpense});

  final void Function(Expense) addNewExpense;

  @override
  State<NewExpense> createState() => _NewExpenceState();
}

class _NewExpenceState extends State<NewExpense> {
  final tilteController = TextEditingController();
  final amountController = TextEditingController();

  Category type = Category.leisure;
  DateTime? selectedDate;

  @override
  void dispose() {
    tilteController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void showCalendarModal() async {
    final currentDate = DateTime.now();
    final firstDate = DateTime(
      currentDate.year - 1,
      currentDate.month,
      currentDate.day,
    );
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: currentDate,
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  void updateExpence() {
    final amount = double.tryParse(amountController.text);
    final bool amountIsInvalid = amount == null || amount <= 0;

    if (tilteController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Please check the inputs"),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Okey'),
            ),
          ],
        ),
      );
    } else {
      widget.addNewExpense(
        Expense(
          text: tilteController.text,
          price: amount,
          date: selectedDate!,
          category: type,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            controller: tilteController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: "\$",
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(selectedDate == null
                        ? "Select Date"
                        : formatter.format(selectedDate!)),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: showCalendarModal,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              DropdownButton(
                value: type,
                items: Category.values.isNotEmpty
                    ? Category.values.map(
                        (category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toString().toUpperCase()),
                          );
                        },
                      ).toList()
                    : [
                        const DropdownMenuItem(
                          child: Text("NO DATA"),
                        ),
                      ],
                onChanged: (value) {
                  setState(() {
                    type = value;
                  });
                },
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: updateExpence,
                    child: const Text('Submit'),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
