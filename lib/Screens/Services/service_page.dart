import 'package:flutter/material.dart';
import 'package:techvillage/Screens/Services/auto.dart';
import 'package:techvillage/Screens/Services/carpenter.dart';
import 'package:techvillage/Screens/Services/coconut_climber.dart';
import 'package:techvillage/Screens/Services/drycleaner.dart';
import 'package:techvillage/Screens/Services/electrician.dart';
import 'package:techvillage/Screens/Services/healthworkers/health.dart';
import 'package:techvillage/Screens/Services/housekeepers.dart';
import 'package:techvillage/Screens/Services/local%20workers/localworkers.dart';
import 'package:techvillage/Screens/Services/mechanic.dart';
import 'package:techvillage/Screens/Services/painter.dart';
import 'package:techvillage/Screens/Services/plumber.dart';
import 'package:techvillage/Screens/Services/tailor.dart';
import 'package:techvillage/Screens/Services/tutor.dart';
import '../../Utils/prod_service_tile.dart';
import '../../Utils/service_list.dart';

class ServicePage extends StatelessWidget {
 

  const ServicePage({super.key});
  

  @override
  Widget build(BuildContext context) {


    List serviceType =  [
      {
        'widget':  const PlumberPage(),
        'fav': true,

      },
      {
        'widget':  const ElectricianPage(),
        'fav': true,

      },
      {
        'widget':  const AutoPage(),
        'fav': true,

      },
      {
        'widget':   HealthPage(),
        'fav': true,

      },
        {
        'widget':   const TailorPage(),
        'fav': true,

      },
      
      {
        'widget':  LocalWorkersPage(),
        'fav': true,

      },
      {
        'widget':  const TutorPage(),
        'fav': true,

      },
      {
        'widget':   const MechanicPage(),
        'fav': true,

      },
      {
        'widget':   const HouseKeepersPage(),
        'fav': true,

      },
      {
        'widget':  const CarpenterPage(),
        'fav': true,

      },
      {
        'widget':  const CoconutClimberPage(),
        'fav': true,

      },
      {
        'widget':  const PainterPage(),
        'fav': true,

      },
      {
        'widget':  const  DryCleanerPage(),
        'fav': true,

      }
   

    ];
    
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Services',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        elevation: 0,
          
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
          itemCount: serviceList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 120,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProdServiceTile(image: serviceList[index],title: serviceTitle[index],type: serviceType[index]['widget'],fav:serviceType[index]['fav']);
          }),
        )
    );
  }
}
