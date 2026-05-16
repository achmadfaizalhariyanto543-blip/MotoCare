import 'package:flutter/material.dart';
import '../models/service.dart';
import 'add_service_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  List<Service> services = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("MotoCare"),
        centerTitle: true,
      ),

      body: services.isEmpty

          ? Center(
              child: Text(
                "Belum ada jadwal servis",
                style: TextStyle(fontSize: 18),
              ),
            )

          : ListView.builder(

              padding: EdgeInsets.all(12),

              itemCount: services.length,

              itemBuilder: (_, index) {

                final service = services[index];

                return Card(

                  elevation: 4,

                  margin: EdgeInsets.only(bottom: 12),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),

                  child: ListTile(

                    contentPadding:
                        EdgeInsets.all(12),

                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,

                      child: Icon(
                        Icons.build,
                        color: Colors.white,
                      ),
                    ),

                    title: Text(
                      service.title,

                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    subtitle: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        SizedBox(height: 5),

                        Text(service.description),

                        SizedBox(height: 5),

                        Text(
                          "${service.date.day}/${service.date.month}/${service.date.year}",
                        ),
                      ],
                    ),

                    trailing: Checkbox(

                      value: service.isDone,

                      onChanged: (value) {

                        setState(() {
                          service.isDone =
                              value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),

      floatingActionButton:
          FloatingActionButton.extended(

        icon: Icon(Icons.add),

        label: Text("Tambah"),

        onPressed: () async {

          final result =
              await Navigator.push(

            context,

            MaterialPageRoute(
              builder: (_) =>
                  AddServiceScreen(),
            ),
          );

          if (result != null) {

            setState(() {
              services.add(result);
            });
          }
        },
      ),
    );
  }
}