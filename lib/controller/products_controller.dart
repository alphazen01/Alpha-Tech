import 'dart:convert';

import 'package:alpha/api/api_url.dart';
import 'package:alpha/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../utils/constant/enum.dart';





class ProductsController extends ChangeNotifier{

DataState dataState = DataState.initial;

ApiUrl apiUrl = ApiUrl();
List<ProductstModel>products=[];


ProductstModel productstModel = ProductstModel();

Future<ProductstModel> fetchProducts(context)async{
  dataState =DataState.loading;
  notifyListeners();
  try {
    final response = await http.get(Uri.parse(apiUrl.ProductsApi));
    if (response.statusCode == 200) {
       
       final data = json.decode(response.body);
      productstModel =ProductstModel.fromJson(data);
      dataState =DataState.loaded;
      
    } else {
       dataState =DataState.error;
       print("Something went wrong");
    }
  } catch (e) {
    print(e.toString());
  }
  notifyListeners();
  return productstModel;





}





}