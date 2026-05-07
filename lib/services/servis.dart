class Service {
  String title;
  String description;
  DateTime date;
  bool isDone;

  Service({
    required this.title,
    required this.description,
    required this.date,
    this.isDone = false,
  });
}