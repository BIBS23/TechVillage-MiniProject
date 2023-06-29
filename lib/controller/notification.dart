import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';

class NotificationBanner with ChangeNotifier {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late String lastProcessedDocumentId = ''; // Initialize with a default 


  void initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
     _configureNotificationSound(); // Configure notification sound

    // Retrieve the last processed document ID from local storage (e.g., SharedPreferences)

    listenForNewDocuments();
    notifyListeners();
  }
  void _configureNotificationSound() {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'myappchannel',
      'techvillage',

      sound: RawResourceAndroidNotificationSound('notification_sound'), // Specify the custom sound file
      importance: Importance.max,
  
    );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }


  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'myappchannel',
      'techvillage',
      importance: Importance.max,
      priority: Priority.high,
    );
    
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      title, // Notification title
      body, // Notification body
      platformChannelSpecifics,
      payload: 'new_document', // Optional payload
    );
    notifyListeners();
  }

  Future<void> onSelectNotification(String? payload) async {
    // Handle notification tap or selection
    if (payload == 'new_document') {
      // Notification payload matches the payload used in showNotification
      // Handle the action here
    }
    notifyListeners();
  }

  void listenForNewDocuments() {
    FirebaseFirestore.instance
        .collection('grants')
        .snapshots()
        .listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.added &&
            change.doc.id != lastProcessedDocumentId) {
          // A new document was added and it's not the same as the last processed document
          showNotification(
            'New Grant Available', // Notification title
            'check out new grants are avilable apply now', // Notification body
          );

          // Update the last processed document ID with the new document's ID
          lastProcessedDocumentId = change.doc.id;
          // Store the last processed document ID in local storage (e.g., SharedPreferences)
        }
      });
    });
    notifyListeners();
  }
}
