class Service {

  String title;
  String description;

  String namaPemilik;
  String merkMotor;
  String kilometer;
  String platNomor;

  DateTime date;

  bool isDone;

  Service({
    required this.title,
    required this.description,

    required this.namaPemilik,
    required this.merkMotor,
    required this.kilometer,
    required this.platNomor,

    required this.date,

    this.isDone = false,
  });
}