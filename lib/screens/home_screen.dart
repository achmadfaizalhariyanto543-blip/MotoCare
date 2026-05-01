import 'package:flutter/material.dart';
import '../models/service.dart';
import 'add_service.dart';
import '../services/notification_service.dart';

List<Service> services = [];

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void checkReminder() {
    for (var service in services) {
      if (!service.isDone &&
          service.date.difference(DateTime.now()).inSeconds <= 5) {
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

    Future.delayed(Duration(seconds: 5), () {
      checkReminder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MotoCare")),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (_, index) {
          final s = services[index];

          return ListTile(
            title: Text(s.title),
            subtitle: Text(s.date.toString()),
            trailing: Checkbox(
              value: s.isDone,
              onChanged: (val) {
                setState(() {
                  s.isDone = val!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddServiceScreen()),
          );

          if (result != null) {
            setState(() {
              services.add(result);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}