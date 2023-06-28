import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techvillage/controller/add_to_fav.dart';

class ProdServiceTile extends StatefulWidget {
  final String? title;
  final String? image;
  final Widget? widget;
  final Widget? type;
  final bool? fav;
  final bool? isFavorite;
  final String? docid;
  final String? appTitle;
  const ProdServiceTile({
    Key? key,
    this.type,
    this.docid,
    this.fav,
    this.isFavorite = false,
    this.title,
    this.image,
    this.widget, 
    this.appTitle,
  }) : super(key: key);

  @override
  State<ProdServiceTile> createState() => _ProdServiceTileState();
}

class _ProdServiceTileState extends State<ProdServiceTile> {
  bool favColor = false;
  String? documentId;

  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('favourites');
  void getData() async {
    QuerySnapshot<Object?> snapshot = await collectionRef.get();

    if (snapshot.docs.isNotEmpty) {
      List<QueryDocumentSnapshot<Object?>> documentList = snapshot.docs;

      for (int i = 0; i < documentList.length; i++) {
        QueryDocumentSnapshot<Object?> documentSnapshot = documentList[i];
        if (widget.title == documentSnapshot.get('title') &&
            widget.image == documentSnapshot.get('image')) {
          documentId = documentSnapshot.id; // Set the document ID

          break; // Exit the loop after finding a match
        }

        // Use the document ID as needed
        print('Document ID at index $i: ${documentSnapshot.id}');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior
          .opaque, // Ensure GestureDetector receives all touch events
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.widget as Widget),
        );
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
                    onPressed: () async {
                      fav.addToFav(widget.title.toString(),
                           widget.image.toString(),widget.appTitle.toString(),context);
                      setState(() {
                        favColor = !favColor;
                      });
                    },
                    icon: Icon(
                      favColor ? Icons.favorite : Icons.favorite_border,
                      color: favColor ? Colors.green : null,
                      size: 28,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 80,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                        image: NetworkImage(widget.image.toString()),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 6, top: 6, left: 20, right: 20),
                child: Text(
                  widget.title.toString(),
                  style: const TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
