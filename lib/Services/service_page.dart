import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techvillage/Services/service_provider_page.dart';

import '../Utils/prod_service_tile.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final TextEditingController _searchController = TextEditingController();
  late Stream<QuerySnapshot> _stream;
  bool expand = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('services').snapshots();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSearch(String searchText) {
    if (searchText.isEmpty) {
      setState(() {
        _stream = FirebaseFirestore.instance.collection('services').snapshots();
      });
    } else {
      String firstLetter = searchText.substring(0, 1).toLowerCase();
      String secondLetter = searchText.length >= 2
          ? searchText.substring(1, 2).toLowerCase()
          : "";
      String thirdLetter = searchText.length >= 3
          ? searchText.substring(2, 3).toLowerCase()
          : "";
      String fourthLetter = searchText.length >= 4
          ? searchText.substring(3, 4).toLowerCase()
          : "";

      setState(() {
        _stream = FirebaseFirestore.instance
            .collection('services')
            .where(FieldPath.documentId,
                isGreaterThanOrEqualTo:
                    firstLetter + secondLetter + thirdLetter + fourthLetter)
            .where(FieldPath.documentId,
                isLessThan: '$firstLetter$secondLetter$thirdLetter${fourthLetter}z')
            .snapshots();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Services';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 202, 59, 100),
        title: expand
            ? null
            :  Text(appTitle,
                style: const TextStyle(fontSize: 20, letterSpacing: 2)),
        centerTitle: true,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: expand ? MediaQuery.of(context).size.width : 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 100),
              child: expand
                  ? TextField(
                    textCapitalization: TextCapitalization.sentences,
                      controller: _searchController,
                      onChanged: _handleSearch,
                      style: const TextStyle(
                          fontSize: 18, letterSpacing: 2, color: Colors.white),
                      decoration: InputDecoration(
                          hintText: expand ? 'search for services' : null,
                          hintStyle: const TextStyle(
                              fontSize: 16,
                              letterSpacing: 2,
                              color: Color.fromARGB(172, 255, 255, 255)),
                          border: InputBorder.none))
                  : null,
            ),
          ),
        ),
        leading: 
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    DateTime timeStamp = DateTime.now();
                    print(timeStamp);
                    setState(() {
                      expand = !expand;
                    });
                    if (expand) {
                      FocusScope.of(context).requestFocus(_focusNode);
                    } else {
                      FocusScope.of(context).unfocus();
                    }
                    _searchController.clear();
                    _stream = FirebaseFirestore.instance
                        .collection('services')
                        .snapshots();
                  },
                  icon: Icon(expand ? Icons.close : Icons.search)))
        ,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _stream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CupertinoActivityIndicator());
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return  Center(child: Image.asset('assets/nodata.png',width: 70,height: 70,));
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 120,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
      
                        return ProdServiceTile(
                            image: documentSnapshot['serviceimg'],
                            title: documentSnapshot['servicetitle'],
                            appTitle: appTitle,
                            widget: ServiceProvidersPage(
                              collectionRef: documentSnapshot.id,
                              servicetitle: documentSnapshot['servicetitle'],
                            ));
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
