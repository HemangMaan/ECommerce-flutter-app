import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    {
      "itemName": "Khal",
      "itemPrice": 2500.0,
      "itemImage": "Images/C5.jpg",
      "itemRating": 3.0,
      "qty": 1,
    },
    {
      "itemName": "Churri",
      "itemPrice": 1500,
      "itemImage": "Images/C4.jpg",
      "itemRating": 4.0,
      "qty": 2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productsOnTheCart.length,
      itemBuilder: (context, index) {
        return SingleCartProduct(
          cartProdName: productsOnTheCart[index]["itemName"],
          cartProdprice: productsOnTheCart[index]["itemPrice"],
          cartProdPicture: productsOnTheCart[index]["itemImage"],
          cartProdQty: productsOnTheCart[index]["qty"],
        );
      },
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPicture;
  final cartProdprice;
  final cartProdQty;

  SingleCartProduct({
    this.cartProdName,
    this.cartProdPicture,
    this.cartProdprice,
    this.cartProdQty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // Leading Image section
        leading: Image.asset(
          cartProdPicture,
          fit: BoxFit.fill,
        ),
        // Title Section
        title: Text(cartProdName),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Section for Quantity of products
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Text("Quantity"),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Text(
                    cartProdQty.toString(),
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 15.0,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {},
                ),

                // section for Price of Product
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Text("Price"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: Text(
                    "₹ $cartProdprice",
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
