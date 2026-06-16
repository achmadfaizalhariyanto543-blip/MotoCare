import 'package:flutter/material.dart';

class Service {
  final String namaMotor;
  final String keluhan;
  final String tanggal;

  Service({
    required this.namaMotor,
    required this.keluhan,
    required this.tanggal,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Service> serviceList = [
    Service(
      namaMotor: "Honda Vario",
      keluhan: "Ganti Oli",
      tanggal: "26 Mei 2026",
    ),
    Service(
      namaMotor: "Yamaha NMAX",
      keluhan: "Servis Mesin",
      tanggal: "25 Mei 2026",
    ),
  ];

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MotoCare",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              "Riwayat Servis",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: serviceList.length,
                itemBuilder: (context, index) {

                  final service = serviceList[index];

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const Icon(
                        Icons.motorcycle,
                        size: 35,
                        color: Colors.blue,
                      ),

                      title: Text(service.namaMotor),

                      subtitle: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(service.keluhan),
                          Text(service.tanggal),
                        ],
                      ),

                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tombol tambah ditekan"),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
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

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}