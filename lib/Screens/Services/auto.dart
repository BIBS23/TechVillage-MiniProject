import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Utils/contact_tile.dart';
import '../other screens/profile_screen.dart';

class AutoPage extends StatefulWidget {
  const AutoPage({super.key});

  @override
  State<AutoPage> createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text('Auto',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('services')
              .doc('auto')
              .collection('worker')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No data'));
          } else {
       
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      return ContactTile(
                         avail: documentSnapshot['availability'],
                        phoneNumber: documentSnapshot['phone'],
                        name: documentSnapshot['name'],
                        exp: documentSnapshot['exp'],
                        istrue: true,
                          profimg: documentSnapshot['profimg'],
                        route: ProfilePage(  profimg: documentSnapshot['profimg'],name: documentSnapshot['name'],profile: documentSnapshot['about'],collection1: 'services',document: 'auto',collection2: 'worker',),
                      );
                    }),
              );
            }
          }),
    );
  }
}

void showCustomSnackBar(BuildContext context, String message) {
    final snackBarTheme = Theme.of(context).snackBarTheme;
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: snackBarTheme.backgroundColor,
      elevation: snackBarTheme.elevation,
      shape: snackBarTheme.shape,
      behavior: snackBarTheme.behavior,
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'OK',
        textColor: snackBarTheme.actionTextColor,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

