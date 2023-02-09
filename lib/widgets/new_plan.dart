import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPlan extends StatefulWidget {
  final Function addPlan;

  const NewPlan(this.addPlan, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewPlanState createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  DateTime? _planSelectedDate;
  final planNameController = TextEditingController();

  void _planAddDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2024),
    ).then(
      (value) => {
        if (value != null)
          {
            setState(() {
              _planSelectedDate = value;
            })
          }
      },
    );
  }

  void _submit() {
    if (planNameController.text.isEmpty || _planSelectedDate == null) {
      return;
    }
    widget.addPlan(planNameController.text, _planSelectedDate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 18,
          left: 18,
          right: 18,
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom + 16
              : 150,
        ),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Reja nomi"),
              controller: planNameController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _planSelectedDate != null
                      ? DateFormat("EEEE, d MMMM, yyy")
                          .format(_planSelectedDate!)
                      : "Reja kuni tanlanmagan...",
                ),
                TextButton(
                  onPressed: () {
                    _planAddDate(context);
                  },
                  child: const Text("KALENDAR"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("BEKOR QILISH"),
                ),
                ElevatedButton(
                  onPressed: _submit,
                  child: const Text("KIRITISH"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
