import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
   late Map<String, CartItem> _items={ };

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount{
    return _items.length;
  }

  double get totalAmout{
    var total=0.0;
    _items.forEach((key, value) {
      total+=value.price*value.quantity;

    });
    return total;

    
  }
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //increase the quantity
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity + 1,
              price: value.price));
    } else {
      //add new item
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 
              1,
              price: price));
    }
    notifyListeners();
  }

  void clear(){
    _items={};
    notifyListeners();
  }
}
