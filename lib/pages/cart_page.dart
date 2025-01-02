import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yamari/components/drink_tile.dart';
import 'package:yamari/models/drink.dart';
import 'package:yamari/models/shop.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
//remove from cart
  void removeFromCart(Drink drink) {
    Provider.of<Yamari>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Yamari>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              const Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),

              //list of cart items
              Expanded(
                child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      //get individual drink in cart
                      Drink drink = value.cart[index];

                      //return as a nice tile
                      return DrinkTile(
                        drink: drink,
                        onTap: () => removeFromCart(drink),
                        trailing: Icon(Icons.delete),
                      );
                    }),
              ),
              //pay button
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: MaterialButton(
                  child: Text(
                    'PAY',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.orange[200],
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
