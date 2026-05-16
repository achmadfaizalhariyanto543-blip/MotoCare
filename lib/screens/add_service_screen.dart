import 'package:flutter/material.dart';
import '../models/service.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() =>
      _AddServiceScreenState();
}

class _AddServiceScreenState
    extends State<AddServiceScreen> {

  final TextEditingController titleController =
      TextEditingController();

  final TextEditingController descController =
      TextEditingController();

  final TextEditingController namaController =
      TextEditingController();

  final TextEditingController merkController =
      TextEditingController();

  final TextEditingController kmController =
      TextEditingController();

  final TextEditingController platController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Tambah Jadwal"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(

          child: Column(

            children: [

              TextField(
                controller: titleController,

                decoration: const InputDecoration(
                  labelText: "Nama Servis",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: descController,

                decoration: const InputDecoration(
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: namaController,

                decoration: const InputDecoration(
                  labelText: "Nama Pemilik",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: merkController,

                decoration: const InputDecoration(
                  labelText: "Merk Motor",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: kmController,

                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: "Kilometer",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: platController,

                decoration: const InputDecoration(
                  labelText: "Plat Nomor",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(

                width: double.infinity,

                child: ElevatedButton.icon(

                  icon: const Icon(Icons.date_range),

                  label: const Text("Pilih Tanggal"),

                  onPressed: () async {

                    DateTime? picked =
                        await showDatePicker(

                      context: context,

                      initialDate: selectedDate,

                      firstDate: DateTime(2020),

                      lastDate: DateTime(2030),
                    );

                    if (picked != null) {

                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  child: const Text("Simpan"),

                  onPressed: () {

                    Navigator.pop(

                      context,

                      Service(

                        title: titleController.text,

                        description:
                            descController.text,

                        namaPemilik:
                            namaController.text,

                        merkMotor:
                            merkController.text,

                        kilometer:
                            kmController.text,

                        platNomor:
                            platController.text,

                        date: selectedDate,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}