import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techvillage/Screens/Services/auto.dart';
import 'package:techvillage/Screens/Services/coconut_climber.dart';
import 'package:techvillage/Screens/Services/housekeepers.dart';
import 'package:techvillage/Screens/Services/local%20workers/localworkers.dart';
import 'package:techvillage/Screens/Services/mechanic.dart';
import 'package:techvillage/Screens/Services/painter.dart';
import 'package:techvillage/Screens/Services/tailor.dart';
import 'package:techvillage/Screens/Services/tutor.dart';
import 'package:techvillage/Screens/products/banana.dart';
import 'package:techvillage/Screens/products/cakes.dart';
import 'package:techvillage/Screens/products/chicken.dart';
import 'package:techvillage/Screens/products/coconut.dart';
import 'package:techvillage/Screens/products/egg.dart';
import 'package:techvillage/Screens/products/fish/fish.dart';
import 'package:techvillage/Screens/products/pickle/pickle_page.dart';
import 'package:techvillage/Screens/products/spices/spices.dart';
import 'package:techvillage/Screens/products/vegetable/vegetables.dart';
import '../Screens/Services/carpenter.dart';
import '../Screens/Services/electrician.dart';
import '../Screens/Services/plumber.dart';
import '../Screens/products/milk.dart';

class AddToFav extends ChangeNotifier {

  User? user = FirebaseAuth.instance.currentUser;
  late String userId = user!.uid;


  // Save the favorites to Firestore

  void addToFav(String prodTitle, String prodImg, BuildContext context) {
    // Check if the item already exists in the favorites collection
    FirebaseFirestore.instance
        .collection('favourites')
        .doc(userId)
        .collection('myfavourites')
        .where('title', isEqualTo: prodTitle)
        .where('image', isEqualTo: prodImg)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        // Show a duplicate message using ScaffoldMessenger
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
              height: 90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(214, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Already Added',
                  style: TextStyle(
                      color: Color.fromARGB(178, 0, 0, 0), letterSpacing: 5),
                ),
              ),
            ),
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        // Check if the total number of items is less than or equal to 6
        FirebaseFirestore.instance
            .collection('favourites')
            .doc(userId)
            .collection('myfavourites')
            .get()
            .then((snapshot) {
          if (snapshot.size >= 6) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(milliseconds: 1000),
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(198, 37, 212, 116),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      'Add up to 6 items only',
                      style: TextStyle(
                          color: Color.fromARGB(178, 0, 0, 0),
                          letterSpacing: 5),
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else {
            // If the item doesn't exist and the total items are less than 6, add it to the favorites collection
            FirebaseFirestore.instance
                .collection('favourites')
                .doc(userId)
                .collection('myfavourites')
                .add({
              'title': prodTitle,
              'image': prodImg,
              'id': userId.toString()
            });
            notifyListeners();
          }
        });
      }
    });
  }

  void deleteItemFromDatabase(
      String documentId, BuildContext context, bool changefavcolor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
                FirebaseFirestore.instance
                    .collection('favourites')
                    .doc(userId)
                    .collection('myfavourites')
                    .doc(documentId)
                    .delete();
        
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Widget getWidgetFromType(String type) {
    // Add your logic here to return the appropriate widget based on the type
    if (type.toLowerCase() == 'plumber') {
      return const PlumberPage();
    } else if (type.toLowerCase() == 'electrician') {
      return const ElectricianPage();
    } else if (type.toLowerCase() == 'carpenter') {
      return const CarpenterPage();
    } else if (type.toLowerCase() == 'milk') {
      return const MilkPage();
    } else if (type.toLowerCase() == 'coconut') {
      return const CoconutPage();
    } else if (type.toLowerCase() == 'egg') {
      return const EggPage();
    } else if (type.toLowerCase() == 'pickles') {
      return PicklePage();
    } else if (type.toLowerCase() == 'fish') {
      return FishPage();
    } else if (type.toLowerCase() == 'chicken') {
      return const ChickenPage();
    } else if (type.toLowerCase() == 'spices') {
      return SpicesPage();
    } else if (type.toLowerCase() == 'vegetables') {
      return VegetablesPage();
    } else if (type.toLowerCase() == 'banana') {
      return const BananaSellersPage();
    } else if (type.toLowerCase() == 'cakes') {
      return const CakeSellersPage();
    } else if (type.toLowerCase() == 'auto') {
      return const AutoPage();
    } else if (type.toLowerCase() == 'health') {
      const CarpenterPage();
    } else if (type.toLowerCase() == 'tailer') {
      return const TailorPage();
    } else if (type.toLowerCase() == 'localworkers') {
      return LocalWorkersPage();
    } else if (type.toLowerCase() == 'tutor') {
      return const TutorPage();
    } else if (type.toLowerCase() == 'mechanic') {
      return const MechanicPage();
    } else if (type.toLowerCase() == 'housekeepers') {
      return const HouseKeepersPage();
    } else if (type.toLowerCase() == 'climbers') {
      return const CoconutClimberPage();
    } else if (type.trim().toLowerCase() == 'painter') {
      return const PainterPage();
    } else {
      // Default case if type doesn't match any of the above
      return const AutoPage();
    }
    notifyListeners();
    return const Scaffold();
  }
}
