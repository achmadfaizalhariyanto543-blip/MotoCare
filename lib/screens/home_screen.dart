import 'package:flutter/material.dart';
import '../models/motor_model.dart';
import '../services/notification_service.dart';
import 'add_motor_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  final List<MotorModel> motorList = [];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final riwayat = motorList
        .where((motor) => motor.selesai)
        .toList();

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(

        backgroundColor: Colors.blue,

        foregroundColor: Colors.white,

        centerTitle: true,

        title: Text(
          "MotoCare (${motorList.length})",
        ),
      ),

      body: currentIndex == 0
          ? _buildBeranda()
          : _buildRiwayat(riwayat),

      floatingActionButton: Column(

        mainAxisAlignment:
            MainAxisAlignment.end,

        children: [

          FloatingActionButton(

            heroTag: "notif",

            backgroundColor:
                Colors.orange,

            onPressed: () async {

              await NotificationService
                  .showNotification(

                title:
                    "Reminder Servis",

                body:
                    "Motor Anda perlu diservis",
              );
            },

            child: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            

            heroTag: "add",

            backgroundColor:
                Colors.blue,

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (_) =>
                      AddMotorPage(

                    onAdd: (motor) {

                      setState(() {

                        motorList.add(
                            motor);
                      });
                    },
                  ),
                ),
              );
            },

            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),

      bottomNavigationBar:
          BottomNavigationBar(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {

            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Riwayat",
          ),
        ],
      ),
    );
  }

  Widget _buildBeranda() {

    if (motorList.isEmpty) {

      return const Center(

        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              Icons.motorcycle,
              size: 80,
              color: Colors.grey,
            ),

            SizedBox(height: 15),

            Text(
              "Belum ada data motor",
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(

      itemCount: motorList.length,

      itemBuilder: (context, index) {

        final motor =
            motorList[index];

        return Card(

          margin:
              const EdgeInsets.all(10),

          elevation: 4,

          shape:
              RoundedRectangleBorder(

            borderRadius:
                BorderRadius.circular(
                    15),
          ),

          child: Column(

            children: [

              ListTile(

                leading:
                    const CircleAvatar(

                  backgroundColor:
                      Colors.blue,

                  child: Icon(
                    Icons.motorcycle,
                    color: Colors.white,
                  ),
                ),

                title: Text(

                  motor.namaPemilik,

                  style:
                      const TextStyle(

                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                subtitle: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    const SizedBox(
                        height: 8),

                    Text(
                        "Motor : ${motor.merkMotor}"),

                    Text(
                        "KM : ${motor.kilometer}"),

                    Text(
                        "Plat : ${motor.platNomor}"),

                    Text(
                        "Servis : ${motor.jenisServis}"),

                    Text(
                        "Jadwal : ${motor.jadwalServis}"),

                    Text(
                        "Catatan : ${motor.deskripsi}"),
                  ],
                ),

                trailing:
                    IconButton(

                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),

                  onPressed: () {

                    setState(() {

                      motorList.removeAt(
                          index);
                    });
                  },
                ),
              ),

              const Divider(),

              CheckboxListTile(

                value: motor.selesai,

                onChanged: (value) {

                  setState(() {

                    motor.selesai =
                        value ?? false;
                  });
                },

                title: Text(

                  motor.selesai

                      ? "✅ Servis Selesai"

                      : "⏳ Belum Servis",
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRiwayat(
      List<MotorModel> riwayat) {

    return Column(

      children: [

        const SizedBox(height: 20),

        const Text(

          "Riwayat Servis",

          style: TextStyle(
            fontSize: 24,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Expanded(

          child: riwayat.isEmpty

              ? const Center(

                  child: Text(

                    "Belum ada riwayat servis",

                    style: TextStyle(

                      fontSize: 18,

                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                )

              : ListView.builder(

                  itemCount:
                      riwayat.length,

                  itemBuilder:
                      (context, index) {

                    final motor =
                        riwayat[index];

                    return Card(

                      margin:
                          const EdgeInsets
                              .symmetric(

                        horizontal: 10,

                        vertical: 5,
                      ),

                      child: ListTile(

                        leading:
                            const Icon(

                          Icons.history,

                          color:
                              Colors.green,
                        ),

                        title: Text(
                            motor.merkMotor),

                        subtitle: Text(

                          "${motor.namaPemilik} • ${motor.jadwalServis}",
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}