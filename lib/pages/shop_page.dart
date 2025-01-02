import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yamari/components/drink_tile.dart';
import 'package:yamari/models/drink.dart';
import 'package:yamari/models/shop.dart';
import 'package:yamari/pages/order_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
//user selected a drink, go to order page
  void goToOrderPage(Drink drink) {
    //navigate to order page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          drink: drink,
        ),
      ),
    );
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
              // ignore: prefer_const_constructors
              Text(
                "YAMARI",
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Shrikhand'
                  ),
              ),

              const SizedBox(
                height: 10,
              ),

              //list of drinks for sale
              Expanded(
                child: ListView.builder(
                  itemCount: Drink.length,
                  itemBuilder: (context, index) { 
                    //get individual drink from shop
                    var individualDrink = value.shop[index];

                    //return that drink as a nice tile
                    return DrinkTile(
                      drink: individualDrink,
                      onTap: () => goToOrderPage(individualDrink),
                      // ignore: prefer_const_constructors
                      trailing: Icon(Icons.arrow_forward),
                    );
                  },
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
