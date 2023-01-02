// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myfirstproject/screen/post/post_detail_page.dart';
import 'package:myfirstproject/widgets/decoration.dart';

class ProductPage extends StatefulWidget {
  static const id = "/productpage";
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  bool isFavourite = false;
  List favourotes = [];
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var category = data["category"];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(category),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: db
            .collection('apartments')
            .where("category", isEqualTo: category)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            Fluttertoast.showToast(msg: "error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final values = snapshot.data!.docs;

          return values.isNotEmpty
              ? ListView.builder(
                  itemCount: values.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  ProductDetailPage.id,
                                  arguments: {
                                    "productname": values[index]['productName'],
                                    "description": values[index]['detail'],
                                    "address": values[index]['address'],
                                    "images": values[index]['imagesUrl'],
                                    "purpose": values[index]['purpose'],
                                    "isPopular": values[index]['isPopular'],
                                    "price": values[index]['price'],
                                    "quantity": values[index]['quantity'],
                                    "contact": values[index]['contact'],
                                  },
                                );
                              },
                              child: Container(
                                decoration: decoration(),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        values[index]['imagesUrl'][0],
                                        fit: BoxFit.scaleDown,
                                        height: 130,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              221, 151, 140, 140),
                                        ),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                            values[index]
                                                                ['address'],
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 25,
                                                            )),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                            values[index]
                                                                    ['price']
                                                                .toString(),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      198,
                                                                      52,
                                                                      52),
                                                              fontSize: 15,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      FontAwesomeIcons.edit),
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  iconSize: 15,
                                                ),
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      FontAwesomeIcons.remove),
                                                  color: Colors.white,
                                                  iconSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    'No Categories Data found',
                  ),
                );
        },
      ),
    );
  }
}
