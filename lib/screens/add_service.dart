import 'package:flutter/material.dart';
import '../models/service.dart';

class AddServiceScreen extends StatefulWidget {
  @override
  State<AddServiceScreen> createState() =>
      _AddServiceScreenState();
}

class _AddServiceScreenState
    extends State<AddServiceScreen> {

  TextEditingController titleController =
      TextEditingController();

  TextEditingController descController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Tambah Jadwal"),
      ),

      body: Padding(

        padding: EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: titleController,

              decoration: InputDecoration(
                labelText: "Nama Servis",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            TextField(
              controller: descController,

              decoration: InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            ElevatedButton.icon(

              icon: Icon(Icons.date_range),

              label: Text("Pilih Tanggal"),

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

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                child: Text("Simpan"),

                onPressed: () {

                  Navigator.pop(
                    context,

                    Service(
                      title: titleController.text,
                      description: descController.text,
                      date: selectedDate,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}