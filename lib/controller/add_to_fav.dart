import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AddToFav extends ChangeNotifier {

  User? user = FirebaseAuth.instance.currentUser;
  late String userId = user!.uid;


  // Save the favorites to Firestore

  void addToFav(String prodTitle, String prodImg,String prodors, BuildContext context) {
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
                    color: const Color.fromARGB(214, 255, 255, 255),
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
              'prodors': prodors,
              'id': userId,
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

  }
