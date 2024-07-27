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
        builder: (context) => OrderPage(drink: drink),
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
                style: TextStyle(fontSize: 30,color: Colors.brown,fontWeight: FontWeight.bold),
              ),
              // List of drinks for sale
              const SizedBox(height: 50,),
              Expanded(
                child: ListView.builder(
                    itemCount: value.shop.length,
                    itemBuilder: (context, index) {
                      //Get drink from shop
                      Drink drink = value.shop[index];
                      return DrinkTile(
                        drink: drink,
                        onTap: () => goToOrderPage(drink),
                        trailing: const Icon(Icons.forward),
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
