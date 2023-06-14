import 'package:boba_tea/OrderPage.dart';
import 'package:boba_tea/components/DrinkTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:boba_tea/models/Drink.dart';
import 'models/Shop.dart';
import 'package:boba_tea/OrderPage.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void goToOrderPage(Drink drink) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Heading
              const Text(
                'Bubble Tea Shop',
                style: TextStyle(fontSize: 20),
              ),
              // List of drinks for sale
              Expanded(
                child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      //Get drink from shop
                      Drink drink = value.shop[index];
                      return DrinkTile(
                        drink: drink,
                        onTap: () => goToOrderPage(drink),
                      );
                      //Return the drink in a decorated manner
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
