import 'package:flutter/material.dart';
import 'package:GroceryCart/Tools/cart_products.dart';

// ignore: must_be_immutable
class MyAppCart extends StatefulWidget {
  // String itemName;
  // double itemPrice;
  // String itemImage;
  // double itemRating;

  // MyAppCart({this.itemName, this.itemPrice, this.itemImage, this.itemRating});
  @override
  _MyAppCartState createState() => _MyAppCartState();
}

class _MyAppCartState extends State<MyAppCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text("Total"),
                subtitle: Text("₹1000"),
              )),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Check out",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.brown,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
