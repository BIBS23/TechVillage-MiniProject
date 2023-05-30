import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techvillage/Utils/contact_tile.dart';

import '../../other screens/profile_screen.dart';

class GooseberryPickleSellersPage extends StatefulWidget {
  const GooseberryPickleSellersPage({super.key});

  @override
  State<GooseberryPickleSellersPage> createState() => _GooseberryPickleSellersPageState();
}

class _GooseberryPickleSellersPageState extends State<GooseberryPickleSellersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
          title: const Text('Gooseberry Pickle',
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
                .collection('products')
                .doc('pickle')
                .collection('gooseberry')
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
                          phoneNumber: documentSnapshot['phone'],
                           avail: documentSnapshot['availability'],
                          name: documentSnapshot['name'],
                          exp: documentSnapshot['exp'],
                          profimg: documentSnapshot['profimg'],
                          route: ProfilePage(  profimg: documentSnapshot['profimg'],name: documentSnapshot['name'],profile: documentSnapshot['about'],document: 'pickle',collection1: 'products',collection2: 'gooseberry',),
                        );
                      }),
                );
              }
            }));
  }
}
