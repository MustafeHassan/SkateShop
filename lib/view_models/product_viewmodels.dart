import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skate_iraq/models/enum.dart';

import '../models/product_models.dart';

class ProductViewModels extends ChangeNotifier{

 Products? products;
LoadingState loadingState = LoadingState.idle;

void fetchProduct() async {
  loadingState = LoadingState.loading;
  notifyListeners();

  await getData();

  loadingState = LoadingState.finished;
  notifyListeners();

}


}

Stream getData() async* {



  // var url = Uri.parse('https://fakestoreapi.com/products');
  //
  // debugPrint('url: $url');
  // var response = await http.get(
  //   url,
  // );
  // debugPrint('response: $response');
  // debugPrint('response.statusCode: ${response.statusCode}');
  // var jsonUsers = jsonDecode(response.body);
  // products = Products.fromJson(data);

   //yield _fireStore.collection('Products').snapshots();

  // jsonUsers.map<Products>((userJson) => Products.fromJson(userJson)).toList();
}