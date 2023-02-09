import 'package:flutter/material.dart';
import 'package:to_do_app/models/plan_model.dart';

class Plan extends StatelessWidget {
  final PlanModel plan;
  final Function planDone;
  final Function deletePlan;

  const Plan(this.plan, this.planDone, this.deletePlan, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
      leading: IconButton(
        onPressed: () {
          planDone(plan.id);
        },
        icon: Icon(
          plan.isDone ? Icons.check_circle_outline : Icons.circle_outlined,
          color: plan.isDone ? Colors.green : Colors.grey,
          size: 24,
        ),
      ),
      title: Text(
        plan.name,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          decoration:
              plan.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          color: plan.isDone ? Colors.grey : Colors.black,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          deletePlan(plan.id);
        },
        icon: const Icon(
          Icons.delete_forever_rounded,
          size: 24,
        ),
      ),
    );
  }
}
