import 'package:flutter/foundation.dart';

class ItemProduct {
  final String name;
  final bool isInCart;

  ItemProduct({required this.name, this.isInCart = false});
}

class CartModel extends ChangeNotifier {
  final List<ItemProduct> _items = [];

  List<ItemProduct> get items => _items;

  void add(ItemProduct item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(ItemProduct item) {
    _items.remove(item);
    notifyListeners();
  }
}
