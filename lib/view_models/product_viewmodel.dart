import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/product_models.dart';

class ProductViewModel extends ChangeNotifier{

  late Products products;
  //Products get product => products;

   fetchProduct() async {

      var url = Uri.parse('https://fakestoreapi.com/products');
      debugPrint('url: $url');

      var response = await http.get(url);
      debugPrint('response statusCode : ${response.statusCode}');

      var data = Products.fromJson(jsonDecode(response.body));
      data = products;
      notifyListeners();
  }
}