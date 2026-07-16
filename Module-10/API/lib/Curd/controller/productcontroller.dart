import 'dart:convert';

import 'package:api/Curd/Model/productmodel.dart';
import 'package:api/Curd/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ProductController {
List<Data>products = [];



  Future fetchProducts()async{
    final response = await http.get(Uri.parse(Urls.readProduct));
    if(response.statusCode==200){
      final data =jsonDecode(response.body);
      
      ProductModel model = ProductModel.fromJson(data);
      products =model.data ?? [];
    }
    

  }

  
  
}