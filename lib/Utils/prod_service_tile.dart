import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techvillage/controller/add_to_fav.dart';

class ProdServiceTile extends StatefulWidget {
  final String image;
  final String title;
  final Widget? type;
  final bool? fav;
  const ProdServiceTile({
    super.key,
    required this.title,
    required this.image,
    this.type,
    this.fav,
  });

  @override
  State<ProdServiceTile> createState() => _ProdServiceTileState();
}

class _ProdServiceTileState extends State<ProdServiceTile> {
  bool favColor = false;
    late String documentId;

  CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('favourites');
  void getData() async {
    

    QuerySnapshot<Object?> snapshot = await collectionRef.get();

    if (snapshot.docs.isNotEmpty) {
      List<QueryDocumentSnapshot<Object?>> documentList = snapshot.docs;

      for (int i = 0; i < documentList.length; i++) {
        QueryDocumentSnapshot<Object?> documentSnapshot = documentList[i];
        documentId = documentSnapshot.id;

        // Use the document ID as needed
        print('Document ID at index $i: $documentId');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior
          .opaque, // Ensure GestureDetector receives all touch events

      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget.type!));
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.1,
                blurRadius: 7,
              ),
            ],
          ),
          child: Consumer<AddToFav>(
            builder: (context, fav, child) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 33,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          splashRadius: 1,
                          onPressed: () {
                            fav.addToFav(
                                widget.title, widget.image,context);
                            
                            setState(() {
                              favColor = !favColor;
                            });
                          },
                          icon: widget.fav == true
                              ? Icon(
                                  favColor
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.green,
                                  size: 28)
                              : const SizedBox.shrink())),
                ),
                Expanded(
                  flex: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(widget.image, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 6, top: 6),
                  child:
                      Text(widget.title, style: const TextStyle(fontSize: 13)),
                ),
              ],
            ),
          )),
    );
  }
}
