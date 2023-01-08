
// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstproject/widgets/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailPage extends StatefulWidget {
  static const id = '/ProductDetailPage';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedIndex = 0;
  int quant = 1;

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    var name = data['productname'];
    var description = data['description'];
    var address = data['address'];
    List images = data['images'];
    var purpose = data['purpose'];
    var price = data['price'];
    var quantity = data['quantity'];
    var contact = data['contact'];
    String? phone;

    getphone() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      phone = prefs.getString('phone');
      print("okk $phone");
      return phone;
    }

    getphone();

    savecart() async {
      await FirebaseFirestore.instance.collection('cart').add({
        'phone': phone,
        'title': name,
        'quantity': quant,
        'price': price * quant,
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image(
                  image: CachedNetworkImageProvider(
                    images[selectedIndex],
                  ),
                  height: 360,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                    top: 60,
                    left: 0,
                    child: Container(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                    )),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(images.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                                print(index);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.deepOrange,
                                      )),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: CachedNetworkImageProvider(
                                        images[index],
                                      ),
                                      height: 30,
                                      width: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          );
                        })
                      ]),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 5,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 5,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Text(" Address",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(" $address".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Text(" Quantity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text(" $quantity".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  spreadRadius: 5,
                                  offset: Offset(3, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FavoriteButton(
                                valueChanged: (isFavorite) {
                                  print('Is Favorite $isFavorite)');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 65, 63, 63)
                                .withOpacity(0.2),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("JUST ONLY :  RS $price ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(
                          5,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(" Contact",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                Text("Nepal: +997 $contact ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Text(description,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  )),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: MaterialButton(
                height: 44,
                minWidth: 300,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return StatefulBuilder(
                          builder: (context, StateSetter setState) {
                            return Dialog(
                                child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Bid Now $name".toUpperCase(),
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("Price"),
                                          Text("Rs. $price"),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quant > quantity - 1) {
                                                dislpayMessage(
                                                    'you can not exceed this limit');
                                              } else {
                                                quant++;
                                              }
                                            });
                                          },
                                          icon: Icon(Icons.add)),
                                      Text(quant.toString()),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quant > 1) quant--;
                                            });
                                          },
                                          icon: Icon(Icons.remove))
                                    ],
                                  ),
                                  Divider(),
                                  Text("Total price  Rs. ${price + quant}"),
                                  Divider(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                // savecart();
                                                // Navigator.push(
                                                //     context,
                                                //     MaterialPageRoute(
                                                //         builder: (_) =>
                                                //             CartScreen()));
                                              },
                                              child: Text("Confirm")),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel")),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                          },
                        );
                      });
                },
                color: Colors.green,
                child: Text(
                  "Bid",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {},
                  child: Text('View Location on Map'),
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
