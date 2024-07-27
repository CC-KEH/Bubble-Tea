import 'dart:collection';

import 'package:boba_tea/models/Drink.dart';
import 'package:boba_tea/models/Shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  const OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  double sweetValue = 0.5;
  double iceValue = 0.5;
  double pearlsValue = 0.5;

  //Customize Sweet Slider
  void customizeSweet(double value) {
    setState(() {
      sweetValue = value;
    });
  }

  //Customize Ice Slider
  void customizeIce(double value) {
    setState(() {
      iceValue = value;
    });
  }

  //Customize Pearls Slider
  void customizePearls(double value) {
    setState(() {
      pearlsValue = value;
    });
  }

  //Add to cart
  void addToCart() {
    //firstly, add to cart
    Provider.of<Shop>(context, listen: false).addToCart(widget.drink);
    //direct user to shop page
    Navigator.pop(context);
    //Let user know drink has been successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added'),
      ),
    );
  }
  Map<String, Color> nameToColors = {
    'Chocci Milk Tea': const Color(0xFF9a6c52),
    'Cement Milk Tea': const Color(0xFFa9b4d2),
    'Gold bubble Tea': const Color(0xFFdf8f2c),  // Colors.gold does not exist, using Colors.yellow as a close alternative
    'Royal bubble Tea': const Color(0xFFff94d8),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
        backgroundColor: nameToColors[widget.drink.name],
      ),
      backgroundColor: const Color(0xffffe3cb),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                //Image of the Drink
                Image.asset(
                  widget.drink.imagePath,
                  scale: 1.5,
                ),
                const SizedBox(
                  height: 30,
                ),
                //Slider for customizing the Drink
                Column(
                  children: [
                    const Text(
                      'Customize',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Sweetness
                    Row(
                      children: [
                        const Text('Sweet'),
                        Slider(
                            value: sweetValue,
                            label: sweetValue.toString(),
                            activeColor: nameToColors[widget.drink.name],
                            divisions: 4,
                            onChanged: (value) => customizeSweet(value)),
                      ],
                    ),
                    //Ice
                    Row(
                      children: [
                        const Text('Ice      '),
                        Slider(
                            value: iceValue,
                            label: iceValue.toString(),
                            activeColor: nameToColors[widget.drink.name],
                            divisions: 4,
                            onChanged: (value) => customizeIce(value)),
                      ],
                    ),
                    //Pearls
                    Row(
                      children: [
                        const Text('Pearls'),
                        Slider(
                            value: pearlsValue,
                            label: pearlsValue.toString(),
                            activeColor: nameToColors[widget.drink.name],
                            divisions: 4,
                            onChanged: (value) => customizePearls(value)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //Add to cart button
                MaterialButton(
                    child: Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: nameToColors[widget.drink.name],
                    onPressed: addToCart)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
