import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techvillage/Utils/granttile.dart';
import 'package:techvillage/controller/notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late int previousLength; // Track the length of the previous snapshot

  @override
  void initState() {
    super.initState();
    previousLength = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: const Text(
          'Grants',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('grants')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CupertinoActivityIndicator());
          }

          final currentLength = snapshot.data!.docs.length;

          if (currentLength > previousLength) {
            // Initialize notification banner
            NotificationBanner notificationBanner = NotificationBanner();
            notificationBanner.initializeNotifications();

            // A new document has been added
            print('A new document has been added.');

            // Update the previous length for the next iteration
            previousLength = currentLength;
          }

          return ListView.builder(
            itemCount: currentLength,
            itemBuilder: (context, index) {
              final DocumentSnapshot documentSnapshot =
                  snapshot.data!.docs[index];
              return GrantTile(
                grant: documentSnapshot['grant'],
                exp: documentSnapshot['exp'],
                category: documentSnapshot['category'],
              );
            },
          );
        },
      ),
    );
  }
}
