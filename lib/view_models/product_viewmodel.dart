import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_models.dart';

class ProductViewModel extends ChangeNotifier{

late Products products;

void fetchProduct(context) async {


 // products = await getData(context);
  notifyListeners();

  // var url = Uri.parse('https://fakestoreapi.com/products');
  // debugPrint('url: $url');
  //
  // var response = await http.get(url);
  // debugPrint('response statusCode : ${response.statusCode}');
  // if(response.statusCode == 200){
  //   product = Products.fromJson(jsonDecode(response.body));
  // }else{
  //   debugPrint('reeeeeeeeeeeeeeeeeeeeore');
  // }
  // notifyListeners();
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