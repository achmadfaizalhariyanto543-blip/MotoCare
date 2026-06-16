import 'package:flutter/material.dart';
import '../models/motor_model.dart';
import 'add_motor_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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

      backgroundColor: Colors.grey[100],

      appBar: AppBar(

        backgroundColor: Colors.blue,

        foregroundColor: Colors.white,

        centerTitle: true,

        title: const Text(

          "MotoCare",

          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),

      body: motorList.isEmpty

          ? Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: const [

                  Icon(
                    Icons.motorcycle,
                    size: 80,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 16),

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
            )

          : ListView.builder(

              itemCount:
                  motorList.length,

              itemBuilder:
                  (_, index) {

                final motor =
                    motorList[index];

                return Card(

                  elevation: 5,

                  margin:
                      const EdgeInsets.all(
                          10),

                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                            15),
                  ),

                  child: ListTile(

                    contentPadding:
                        const EdgeInsets.all(
                            16),

                    leading: Container(

                      padding:
                          const EdgeInsets.all(
                              10),

                      decoration:
                          BoxDecoration(

                        color: Colors
                            .blue.shade100,

                        borderRadius:
                            BorderRadius
                                .circular(
                                    12),
                      ),

                      child: const Icon(
                        Icons.motorcycle,
                        color: Colors.blue,
                      ),
                    ),

                    title: Text(

                      motor.namaPemilik,

                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 18,
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
                          "Motor : ${motor.merkMotor}",
                        ),

                        const SizedBox(
                            height: 5),

                        Text(
                          "KM : ${motor.kilometer}",
                        ),

                        const SizedBox(
                            height: 5),

                        Text(
                          "Plat : ${motor.platNomor}",
                        ),
                      ],
                    ),

                    trailing: Row(

                      mainAxisSize:
                          MainAxisSize.min,

                      children: [

                        IconButton(

                          icon: const Icon(
                            Icons.edit,
                            color: Colors.orange,
                          ),

                          onPressed: () {

                            // EDIT DATA

                          },
                        ),

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
                      ],
                    ),
                  ),
                );
              },
            ),

      floatingActionButton:
          FloatingActionButton(

        backgroundColor:
            Colors.blue,

        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),

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
      ),
    );
  }
}