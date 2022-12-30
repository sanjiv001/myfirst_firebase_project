

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? category;
  String? productName;
  String? detail;
  int? price;
  String? contact;
  String? address;
  int? quantity;
  List<String>? imagesUrl;
  bool? isOnSale;
  bool? isPopular;

  ProductModel({
    this.category,
    this.productName,
    this.detail,  
    this.price,
    this.contact,
    this.address,
    this.quantity,
    this.imagesUrl,
    this.isOnSale,
    this.isPopular,
  });
  CollectionReference db = FirebaseFirestore.instance.collection('apartments');

  Future<void> addProduct(ProductModel productModel) async {
    Map<String, dynamic> data = {
     "category": productModel.category,
      "productName": productModel.productName,
      "detail": productModel.detail,
      "price": productModel.price,
      "contact": productModel.contact,
      "address": productModel.address,
      "quantity": productModel.quantity,
      "imagesUrl": productModel.imagesUrl,
      "isOnSale": productModel.isOnSale,
      "isPopular": productModel.isPopular,
    };
    await db.add(data);
  }

  Future<void> updateProduct(String id, ProductModel updateProduct) async {
    Map<String, dynamic> data = {
     "category": updateProduct.category,
      "productName": updateProduct.productName,
      "price": updateProduct.price,
      "contact": updateProduct.contact,
      "address": updateProduct.address,
      "quantity": updateProduct.quantity,
     "imagesUrl": updateProduct.imagesUrl,
      "isOnSale": updateProduct.isOnSale,
      "isPopular": updateProduct.isPopular,
    };
   await db.doc(id).update(data);
  }

 Future<void> delete(String id) async {
   await db.doc(id).delete();
 }
}