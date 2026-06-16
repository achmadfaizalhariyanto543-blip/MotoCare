import 'package:flutter/material.dart';
import '../models/motor_model.dart';

class AddMotorPage extends StatefulWidget {
  final Function(MotorModel) onAdd;

  const AddMotorPage({
    super.key,
    required this.onAdd,
  });

  @override
  State<AddMotorPage> createState() => _AddMotorPageState();
}

class _AddMotorPageState extends State<AddMotorPage> {
  final namaController = TextEditingController();
  final merkController = TextEditingController();
  final kmController = TextEditingController();
  final platController = TextEditingController();
  final servisController = TextEditingController();
  final jadwalController = TextEditingController();
  final deskripsiController = TextEditingController();

  InputDecoration customInput(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.blue,
          width: 2,
        ),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    merkController.dispose();
    kmController.dispose();
    platController.dispose();
    servisController.dispose();
    jadwalController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("Tambah Motor"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Nama Pemilik
            TextField(
              controller: namaController,
              decoration: customInput("Nama Pemilik"),
            ),

            const SizedBox(height: 12),

            // Merk Motor
            TextField(
              controller: merkController,
              decoration: customInput("Merk Motor"),
            ),

            const SizedBox(height: 12),

            // Kilometer
            TextField(
              controller: kmController,
              keyboardType: TextInputType.number,
              decoration: customInput("Kilometer"),
            ),

            const SizedBox(height: 12),

            // Plat Nomor
            TextField(
              controller: platController,
              decoration: customInput("Plat Nomor"),
            ),

            const SizedBox(height: 12),

            // Jenis Servis
            TextField(
              controller: servisController,
              decoration: customInput("Jenis Servis"),
            ),

            const SizedBox(height: 12),

            // Jadwal Servis
            TextField(
              controller: jadwalController,
              readOnly: true,
              decoration: customInput("Jadwal Servis").copyWith(
                prefixIcon: const Icon(
                  Icons.calendar_month,
                ),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2030),
                );

                if (pickedDate != null) {
                  setState(() {
                    jadwalController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),

            const SizedBox(height: 12),

            // Deskripsi
            TextField(
              controller: deskripsiController,
              maxLines: 3,
              decoration: customInput("Deskripsi"),
            ),

            const SizedBox(height: 24),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(
                    double.infinity,
                    55,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (namaController.text.isEmpty ||
                      merkController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Nama Pemilik dan Merk Motor wajib diisi!",
                        ),
                      ),
                    );
                    return;
                  }

                  final motor = MotorModel(
                    namaPemilik: namaController.text,
                    merkMotor: merkController.text,
                    kilometer: kmController.text,
                    platNomor: platController.text,
                    jenisServis: servisController.text,
                    jadwalServis: jadwalController.text,
                    deskripsi: deskripsiController.text,
                  );

                  widget.onAdd(motor);

                  Navigator.pop(context);
                },
                child: const Text(
                  "Simpan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}