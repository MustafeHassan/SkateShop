import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:skate_iraq/models/enum.dart';

import '../models/product_models.dart';

class ProductViewModel extends ChangeNotifier{

 Products? products;
LoadingState loadingState = LoadingState.idle;

void fetchProduct() async {
  loadingState = LoadingState.loading;
  notifyListeners();

  products = await getData();

  loadingState = LoadingState.finished;
  notifyListeners();

}
}

Future getData() async {

    var url = Uri.parse('https://fakestoreapi.com/products');

    debugPrint('url: $url');
    var response = await http.get(
      url,
    );
    debugPrint('response: $response');
    debugPrint('response.statusCode: ${response.statusCode}');
    var jsonUsers = jsonDecode(response.body);
  // products = Products.fromJson(data);
  return jsonUsers.map<Products>((userJson) => Products.fromJson(userJson)).toList();
}