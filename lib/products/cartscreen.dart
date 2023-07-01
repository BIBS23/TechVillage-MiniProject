import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pay/pay.dart';
import 'package:techvillage/payment_confi.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  late String userId = user!.uid;

  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
    paymentItems: const [
      PaymentItem(
        label: 'Total',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      )
    ],
    type: GooglePayButtonType.pay,
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 20, letterSpacing: 2),
        ),
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('mycart')
            .doc(userId)
            .collection('cartitems')
            .where('id', isEqualTo: userId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_tbrwjiv5.json',
                    width: 130,
                    height: 130));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return  Center(child: Image.network('https://mir-s3-cdn-cf.behance.net/projects/404/95974e121862329.Y3JvcCw5MjIsNzIxLDAsMTM5.png'));
          } else {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                      snapshot.data!.docs[index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        ListTile(
                            leading: Image.network(
                              documentSnapshot['prodimg'],
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                            title: Text(documentSnapshot['prodname']),
                            subtitle: Text(documentSnapshot['rate'])),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          SizedBox(height: 45, child: googlePayButton),
                          IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('mycart')
                                    .doc(userId).collection('cartitems').doc(documentSnapshot.id)
                                    .delete();
                              },
                              icon: const Icon(Icons.delete,size: 35,))
                        ]),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromARGB(96, 0, 0, 0),
                        ),
                         const SizedBox(height: 10),
                      ]));
                });
          }
        },
      ),
    );
  }
}
