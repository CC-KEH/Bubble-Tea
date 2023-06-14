import 'package:boba_tea/models/Drink.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  //List of drinks for sale
  final List<Drink> _shop = [
    //Pearl milk tea
    Drink(name:'Chocci Milk Tea',price: '120.0rs',imagePath: 'lib/images/choci.png'),
    //Choci milk tea
    Drink(name:'Cement Milk Tea',price: '140.0rs',imagePath: 'lib/images/cement.png'),
    //Coffeed bubble tea
    Drink(name:'Gold bubble Tea',price: '130.0rs',imagePath: 'lib/images/gold.png'),
    //Coffeed bubble tea
    Drink(name:'Royal bubble Tea',price: '130.0rs',imagePath: 'lib/images/royal.png'),
  ];
  //List of drinks in user cart
  final List<Drink> _cart = [];
  //Get drinks for sale
  List<Drink> get shop => _shop;
  //Get user cart
  List<Drink> get cart => _cart;
  //Add drink to cart
  void addToCart(Drink drink){
    _cart.add(drink);
    notifyListeners();
  }
  //Remove drink from cart
  void removeFromCart(Drink drink){
    _cart.remove(drink);
    notifyListeners();
  }
}
