class MotorModel {
  String namaPemilik;
  String merkMotor;
  String kilometer;
  String platNomor;
  String jenisServis;
  String jadwalServis;
  String deskripsi;

  bool selesai; // tambahkan ini

  MotorModel({
    required this.namaPemilik,
    required this.merkMotor,
    required this.kilometer,
    required this.platNomor,
    required this.jenisServis,
    required this.jadwalServis,
    required this.deskripsi,
    this.selesai = false,
  });
}