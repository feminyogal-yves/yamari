import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yamari/models/drink.dart';
import 'package:yamari/models/shop.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    super.key,
    required this.drink,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
//customize sweetness
  double sweetvalue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetvalue = newValue;
    });
  }

  //customize ice
  double icevalue = 0.5;

  void iceSweet(double newValue) {
    setState(() {
      icevalue = newValue;
    });
  }

  //add to cart
  void addtocart() {
    Provider.of<Yamari>(context, listen: false).addToCart(widget.drink);

    //direct user back to shop page
    Navigator.pop(context);

    //let user know it has been successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: Colors.amber[50],
      body: Column(
        children: [
          //drink image
          Container(
            width: 500,
            height: 450.0,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 90.0,
              child: Image.asset(widget.drink.ImagePath),
            ),
          ),

          //slidersto customize drinks
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                //sweetness slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 100, child: Text('SWEET')),
                    Expanded(
                      child: Slider(
                        value: sweetvalue,
                        label: sweetvalue.toString(),
                        activeColor: Colors.amber[300],
                        divisions: 5,
                        onChanged: (value) => customizeSweet(value),
                      ),
                    ),
                  ],
                ),

                //ice
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 100, child: Text('ICE')),
                    Expanded(
                      child: Slider(
                        value: icevalue,
                        label: icevalue.toString(),
                        activeColor: Colors.amber[300],
                        divisions: 5,
                        onChanged: (value) => iceSweet(value),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //add to cart button
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.orange[200],
            onPressed: addtocart,
            child: const Text(
              'ADD TO CART',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
