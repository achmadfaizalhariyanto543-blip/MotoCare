class Service {
  String title;
  DateTime date;
  bool isDone;

  Service({
    required this.title,
    required this.date,
    this.isDone = false,
  });
}