import 'package:flutter/material.dart';
import '../models/motor_model.dart';
import 'add_motor_page.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  List<MotorModel> motorList = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("MotoCare"),
      ),

      body: ListView.builder(

        itemCount: motorList.length,

        itemBuilder: (_, index) {

          final motor = motorList[index];

          return Card(

            margin: EdgeInsets.all(10),

            child: ListTile(

              leading:
                  Icon(Icons.motorcycle),

              title: Text(
                motor.namaPemilik,
              ),

              subtitle: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    motor.merkMotor,
                  ),

                  Text(
                    motor.kilometer,
                  ),

                  Text(
                    motor.platNomor,
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton:
          FloatingActionButton(

        onPressed: () {

          Navigator.push(

            context,

            MaterialPageRoute(

              builder: (_) =>
                  AddMotorPage(

                onAdd: (motor) {

                  setState(() {

                    motorList.add(motor);
                  });
                },
              ),
            ),
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}