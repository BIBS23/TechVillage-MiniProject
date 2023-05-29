import 'package:flutter/material.dart';
import 'package:techvillage/Screens/Services/healthworkers/dentist.dart';
import 'package:techvillage/Screens/Services/healthworkers/homenurse.dart';
import 'package:techvillage/Utils/prod_service_tile.dart';
import 'ashaworker.dart';
import 'doctor.dart';
import 'nurse.dart';

class HealthPage extends StatelessWidget {
  final List healthType = [
    'Doctor',
    'Nurse',
    'Home Nurse',
    'Dentist',
    'Asha Worker'
  ];

  final List healthImg = ['assets/doctor.jpg', 'assets/nurse.jpg','assets/homenurse.jpg','assets/dentist.jpg','assets/ashaworker.jpg'];
  final List healthTypePage = const  [
    DoctorsPage(),
    NursePage(),
    HomeNursePage(),
    DentistPage(),
    AshaWorkerPage(),
   
  ];

  HealthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Health Workers',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: healthImg.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 120,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return ProdServiceTile(
                title: healthType[index],
                image: healthImg[index],
                type: healthTypePage[index],
              );
            }),
      ),
    );
  }
}
