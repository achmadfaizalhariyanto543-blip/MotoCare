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
  final platController = TextEditingController();
  final kmController = TextEditingController();
  final servisController = TextEditingController();
  final jadwalController = TextEditingController();
  final deskripsiController = TextEditingController();

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
    );
  }

  Future<void> pilihTanggal() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (pickedDate != null) {
      setState(() {
        jadwalController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void _simpanData() {
    if (namaController.text.trim().isEmpty ||
        merkController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Nama Pemilik dan Merk Motor wajib diisi',
          ),
        ),
      );
      return;
    }

    final motor = MotorModel(
      namaPemilik: namaController.text.trim(),
      merkMotor: merkController.text.trim(),
      platNomor: platController.text.trim(),
      kilometer: kmController.text.trim(),
      jenisServis: servisController.text.trim(),
      jadwalServis: jadwalController.text.trim(),
      deskripsi: deskripsiController.text.trim(),
    );

    widget.onAdd(motor);

    Navigator.pop(context);
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        readOnly: readOnly,
        onTap: onTap,
        decoration: _inputDecoration(label),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    merkController.dispose();
    platController.dispose();
    kmController.dispose();
    servisController.dispose();
    jadwalController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data Motor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTextField(
              controller: namaController,
              label: 'Nama Pemilik',
            ),

            _buildTextField(
              controller: merkController,
              label: 'Merk Motor',
            ),

            _buildTextField(
              controller: platController,
              label: 'Plat Nomor',
            ),

            _buildTextField(
              controller: kmController,
              label: 'Kilometer',
              keyboardType: TextInputType.number,
            ),

            _buildTextField(
              controller: servisController,
              label: 'Jenis Servis',
            ),

            _buildTextField(
              controller: jadwalController,
              label: 'Jadwal Servis',
              readOnly: true,
              onTap: pilihTanggal,
            ),

            _buildTextField(
              controller: deskripsiController,
              label: 'Deskripsi',
              maxLines: 3,
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _simpanData,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 14,
                  ),
                  child: Text('Simpan'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}