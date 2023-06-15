import 'package:boba_tea/components/DrinkTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/Drink.dart';
import 'models/Shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  String titleValue = 'Your Cart';

  void removeDrink(Drink drink) {
    Provider.of<Shop>(context, listen: false).removeFromCart(drink);
  }

  void pay() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //Heading
              Text(
                titleValue,
                style: const TextStyle(
                  fontSize: 35,
                ),
              ),
              //List of Items in cart
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get individual drink
                    Drink drink = value.cart[index];
                    return DrinkTile(
                      drink: drink,
                      onTap: () => removeDrink(drink),
                      trailing: const Icon(Icons.delete),
                    );
                  },
                ),
              ),
              //pay button
               MaterialButton(
                 color: Colors.brown,
                 onPressed: pay,
                  child: const Text(
                  'PAY',
                  style: TextStyle(color: Colors.white),
                 ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
