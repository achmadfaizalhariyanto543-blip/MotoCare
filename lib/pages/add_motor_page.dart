import 'package:flutter/material.dart';
import '../models/motor_model.dart';

class AddMotorPage extends StatefulWidget {
  final Function(MotorModel) onAdd;

  const AddMotorPage({super.key, required this.onAdd});

  @override
  State<AddMotorPage> createState() => _AddMotorPageState();
}

class _AddMotorPageState extends State<AddMotorPage> {
  final namaController = TextEditingController();
  final merkController = TextEditingController();
  final platController = TextEditingController();
  final kmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Data Motor"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama Pemilik",
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: merkController,
              decoration: const InputDecoration(
                labelText: "Merk Motor",
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: platController,
              decoration: const InputDecoration(
                labelText: "Plat Nomor",
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: kmController,
              decoration: const InputDecoration(
                labelText: "Kilometer",
              ),
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final motor = MotorModel(
                    namaPemilik: namaController.text,
                    merkMotor: merkController.text,
                    platNomor: platController.text,
                    kilometer: kmController.text,
                  );

                  widget.onAdd(motor);

                  Navigator.pop(context);
                },
                child: const Text("Simpan"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
