import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _HomeState();
}

class _HomeState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Bubble Tea Shop',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.brown),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
                child: const Image(image: AssetImage('lib/images/drinks.jpg'))),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Welcome to the Bubble Tea App, your go-to solution for exploring and ordering bubble tea! Our user-friendly app lets you discover diverse flavors, locate nearby shops, and customize your orders effortlessly. Whether you\'re a seasoned boba lover or new to bubble tea, enjoy a seamless experience every time.',
              style: TextStyle(color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }
}
