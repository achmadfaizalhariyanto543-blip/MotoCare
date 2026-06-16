import 'package:flutter/material.dart';
import '../models/motor_model.dart';

class HistoryPage extends StatelessWidget {

  final List<MotorModel> motorList;

  const HistoryPage({
    super.key,
    required this.motorList,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Riwayat Servis",
        ),
      ),

      body: ListView.builder(

        itemCount: motorList.length,

        itemBuilder: (context, index) {

          final motor =
              motorList[index];

          return ListTile(

            leading:
                const Icon(Icons.history),

            title:
                Text(motor.merkMotor),

            subtitle:
                Text(motor.jadwalServis),
          );
        },
      ),
    );
  }
}