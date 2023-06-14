import 'package:flutter/material.dart';

import '../models/Drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  void Function()? onTap;
  DrinkTile({
    super.key,
    required this.drink,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagePath),
          trailing: const Icon(Icons.forward),
        ),
      ),
      SizedBox(
        height: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 220,
        ),
      ),
    ]);
  }
}
