import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<Map<String, dynamic>> cartItems = [];

  void addItem(String name, int price, int quantity) {
    cartItems.add({'name': name, 'price': price, 'quantity': quantity});
    notifyListeners();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  List<Map<String, dynamic>> get items => cartItems;

  int getTotalCost() {
    int totalCost = 0;
    for (var item in cartItems) {
      totalCost += (item['price'] * item['quantity']) as int;
    }
    return totalCost;
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
