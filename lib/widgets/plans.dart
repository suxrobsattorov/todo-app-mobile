import '../models/plan_model.dart';

class Plans {
  final List<PlanModel> _plans = [
    PlanModel(id: "1", name: "Bozorga borish", date: DateTime.now()),
    PlanModel(id: "2", name: "Kitob o'qish", date: DateTime.now()),
    PlanModel(id: "3", name: "Dars qilish", date: DateTime.now()),
  ];

  List<PlanModel> get plans {
    return _plans;
  }

  List<PlanModel> planByDay(DateTime date) {
    return _plans
        .where((plan) =>
            plan.date.day == date.day &&
            plan.date.month == date.month &&
            plan.date.year == date.year)
        .toList();
  }

  void addPlan(String planName, DateTime planDate) {
    _plans.add(
        PlanModel(id: "${_plans.length + 1}", name: planName, date: planDate));
  }

  void removePlan(String id) {
    _plans.removeWhere((plan) => plan.id == id);
  }
}
