class PlanModel {
  final String id;
  final String name;
  final DateTime date;
  bool isDone = false;

  PlanModel({
    required this.id,
    required this.name,
    required this.date,
  });

  void changeDone() {
    isDone = !isDone;
  }
}
