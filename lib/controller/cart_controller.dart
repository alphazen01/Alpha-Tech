import 'package:alpha/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends ChangeNotifier{
  CartController();
  initial()async{
    preferences = await SharedPreferences.getInstance();
    _count = preferences!.getInt("cart_item")??0;
  }

ProductstModel productstModel = ProductstModel();

int _count =0;
int get count=>_count;

double _totalPrice = 0.0;
double get totalPrice => _totalPrice;

SharedPreferences? preferences;

void _setPrefItem()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("cart_item", _count);
  prefs.setDouble("total_price", _totalPrice);
  notifyListeners();
}
void _getPrefItem()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _count = prefs.getInt("cart_item")??0;
  _totalPrice = prefs.getDouble("total_price")??0.0;
 
  notifyListeners();
}

void increment()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _count++;
  _setPrefItem();
  notifyListeners();
}

void decrement(){
  _count--;
  _setPrefItem();
  notifyListeners();
}

int getCount (){
  _getPrefItem();
  return _count;
}
void addToCart(double  productPrice){
increment();
addTotalPrice(productPrice);
SharedPreferences.getInstance();
}




void addTotalPrice(double productPrice){
  _totalPrice=_totalPrice + productPrice;
  _setPrefItem();
  notifyListeners();
}

void removeTotalPrice(double productPrice){
  _totalPrice=_totalPrice - productPrice;
  _setPrefItem();
  notifyListeners();
}

double getTotalPrice (){
  _getPrefItem();
  return _totalPrice;
}











}