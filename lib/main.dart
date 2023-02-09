import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/widgets/date_ot_plans.dart';
import 'package:to_do_app/widgets/list_op_plans.dart';
import 'package:to_do_app/widgets/new_plan.dart';
import 'package:to_do_app/widgets/plan_information.dart';
import 'package:to_do_app/widgets/plans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: const Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final Plans _plans = Plans();
  DateTime _selectedDay = DateTime.now();

  void _chooseADate(BuildContext context) {
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
              _selectedDay = value;
            })
          }
      },
    );
  }

  void _previousDate() {
    setState(() {
      _selectedDay =
          DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day - 1);
    });
  }

  void _nextDate() {
    setState(() {
      _selectedDay =
          DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day + 1);
    });
  }

  void _planDone(String id) {
    setState(() {
      _plans
          .planByDay(_selectedDay)
          .firstWhere((plan) => plan.id == id)
          .changeDone();
    });
  }

  void _deletePlan(String id) {
    setState(() {
      _plans.removePlan(id);
    });
  }

  int get _plansCount {
    return _plans.planByDay(_selectedDay).length;
  }

  int get _donePlansCount {
    return _plans.planByDay(_selectedDay).where((plan) => plan.isDone).length;
  }

  void _addPlan(String planName, DateTime planDate) {
    setState(() {
      _plans.addPlan(planName, planDate);
    });
  }

  void _addPlanWindow(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (builder) {
        return NewPlan(_addPlan);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Todo App",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          DateOfPlans(_chooseADate, _selectedDay, _previousDate, _nextDate),
          PlanInformation(_plansCount, _donePlansCount),
          ListOfPlans(_plans.planByDay(_selectedDay), _planDone, _deletePlan),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addPlanWindow(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
