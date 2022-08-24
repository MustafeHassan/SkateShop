import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_models.dart';

class ProductViewModel extends ChangeNotifier{

late Products product;

void fetchProduct(context) async {


  product = await getData(context);
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

Future<Products> getData(context) async {
  late Products dataModel;

  try {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      dataModel = Products.fromJson(data);
    }else{
      print("Something went wrong");
    }
  } catch (e) {
    print(e.toString());
  }

  return dataModel;
}