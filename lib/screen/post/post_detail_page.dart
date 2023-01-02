// ignore_for_file: unused_local_variable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  static const id = 'ProductDetailPage';

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int selectedIndex = 0;
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // if (ModalRoute.of(context)?.settings.arguments != null) {
    //   final data =
    //       ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    // }

    if (ModalRoute.of(context)?.settings.arguments != null) {
      final data =
          ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>;
    }
    var name = data['productname'];
    var description = data['description'];
    var address = data['address'];
    ///List images = data['images'];
    var purpose = data['purpose'];
    var isPopular = data['isPopular'];
    var price = data['price'];
    var quantity = data['quantity'];
    var contact = data['contact'];

    // getphone() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   phone = prefs.getString('phone')!;
    //   print("okk $phone");
    //   return phone;
    // }

    // getphone();

    // savecart() async {
    //   await FirebaseFirestore.instance.collection('favourite').add({
    //     'contact': contact,
    //     'title': name,
    //     'quantity': quant,
    //     'price': price * quant,
    //   });
    // }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Image(
                //   image: CachedNetworkImageProvider(
                //     images[selectedIndex],
                //   ),
                //   height: 300,
                //   fit: BoxFit.cover,
                // ),
                Positioned(
                    top: 20,
                    left: 0,
                    child: Container(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          )),
                    )),
                // Positioned(
                //   bottom: -10,
                //   left: 0,
                //   right: 0,
                //   child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         ...List.generate(images.length, (index) {
                //           return Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: InkWell(
                //               onTap: () {
                //                 setState(() {
                //                   selectedIndex = index;
                //                 });
                //                 print(index);
                //               },
                //               child: Container(
                //                   decoration: BoxDecoration(
                //                       borderRadius: BorderRadius.circular(10),
                //                       border: Border.all(
                //                         color: Colors.deepOrange,
                //                       )),
                //                   child: ClipRRect(
                //                     borderRadius: BorderRadius.circular(10),
                //                     child: Image(
                //                       image: CachedNetworkImageProvider(
                //                         images[index],
                //                       ),
                //                       height: 50,
                //                       width: 40,
                //                       fit: BoxFit.cover,
                //                     ),
                //                     // child: Image.network(
                //                     //   images[index],
                //                     //   height: 50,
                //                     //   width: 40,
                //                     //   fit: BoxFit.cover,
                //                     // ),
                //                   )),
                //             ),
                //           );
                //         })
                //       ]),
                // ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 5,
                    offset: const Offset(3, 3),
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
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
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
                                  offset: const Offset(3, 3),
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
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              //color: Colors.grey.withOpacity(0.2),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(description,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                )),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.2),
                borderRadius: BorderRadius.circular(
                  5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    spreadRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      purpose ? "ON SALE" : "RENT",
                      style: const TextStyle(fontSize: 17, color: Colors.black),
                    ),
                    Text("JUST ONLY : $price RS",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                ),
              ),
            ),
            // MaterialButton(
            //   minWidth: double.infinity,
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         builder: (_) {
            //           return StatefulBuilder(
            //             builder: (context, StateSetter setState) {
            //               return Dialog(
            //                   child: Padding(
            //                 padding: const EdgeInsets.all(18.0),
            //                 child: Column(
            //                   mainAxisSize: MainAxisSize.min,
            //                   children: [
            //                     Text(
            //                       "purchase $name".toUpperCase(),
            //                     ),
            //                     const Divider(),
            //                     Row(
            //                       children: [
            //                         Column(
            //                           children: [
            //                             const Text("enter quantity"),
            //                             Text("max $quantity"),
            //                           ],
            //                         ),
            //                         IconButton(
            //                             onPressed: () {
            //                               setState(() {
            //                                 if (quant > quantity - 1) {
            //                                   dislpayMessage(
            //                                       'you can not exceed this limit');
            //                                 } else {
            //                                   quant++;
            //                                 }
            //                               });
            //                             },
            //                             icon: const Icon(Icons.add)),
            //                         Text(quant.toString()),
            //                         IconButton(
            //                             onPressed: () {
            //                               setState(() {
            //                                 if (quant > 1) quant--;
            //                               });
            //                             },
            //                             icon: const Icon(Icons.remove))
            //                       ],
            //                     ),
            //                     const Divider(),
            //                     Text("total price ${price * quant}"),
            //                     const Divider(),
            //                     Row(
            //                       children: [
            //                         Expanded(
            //                           child: Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: ElevatedButton(
            //                                 onPressed: () {
            //                                   // savecart();
            //                                   // Navigator.push(
            //                                   //     context,
            //                                   //     MaterialPageRoute(
            //                                   //         builder: (_) =>
            //                                   //             CartScreen()));
            //                                 },
            //                                 child: const Text("Confirm")),
            //                           ),
            //                         ),
            //                         Expanded(
            //                           child: Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: ElevatedButton(
            //                                 onPressed: () {
            //                                   Navigator.pop(context);
            //                                 },
            //                                 child: const Text("Cancel")),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               ));
            //             },
            //           );
            //         });
            //   },
            //   color: Colors.green,
            //   child: const Text("ADD TO FAVOURITE"),
            // )
          ],
        ),
      ),
    );
  }
}
