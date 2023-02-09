import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/plan.dart';

import '../models/plan_model.dart';

class ListOfPlans extends StatelessWidget {
  final List<PlanModel> plans;
  final Function planDone;
  final Function deletePlan;

  const ListOfPlans(this.plans, this.planDone, this.deletePlan, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: plans.length > 0
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Plan(plans[index], planDone, deletePlan);
              },
              itemCount: plans.length,
            )
          : Column(
              children: [
                const Text(
                  "Hozircha rejalar yo'q!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/sleep.png",
                  fit: BoxFit.cover,
                  width: 200,
                ),
              ],
            ),
    );
  }
}
