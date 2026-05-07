import 'package:flutter/material.dart';
import '../models/service.dart';
import 'add_service.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  List<Service> services = [];

  void checkReminder() {

    for (var service in services) {

      if (!service.isDone &&
          service.date
                  .difference(DateTime.now())
                  .inSeconds <=
              5) {

        NotificationService.showNotification(
          "Reminder Servis",
          service.title,
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 5),
      () {
        checkReminder();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("MotoCare"),
      ),

      body: services.isEmpty

          ? Center(
              child: Text(
                "Belum ada jadwal servis",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            )

          : ListView.builder(

              itemCount: services.length,

              itemBuilder: (_, index) {

                final service =
                    services[index];

                return Card(

                  margin: EdgeInsets.all(10),

                  child: ListTile(

                    leading:
                        Icon(Icons.build),

                    title:
                        Text(service.title),

                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [

                        Text(
                          service.description,
                        ),

                        SizedBox(height: 5),

                        Text(
                          service.date
                              .toString(),
                        ),
                      ],
                    ),

                    trailing: Checkbox(
                      value: service.isDone,

                      onChanged: (val) {

                        setState(() {

                          service.isDone =
                              val!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),

      floatingActionButton:
          FloatingActionButton(

        child: Icon(Icons.add),

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