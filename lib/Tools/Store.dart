//import 'package:flutter/material.dart';

class Store {
  String itemName;
  double itemPrice;
  String itemImage;
  double itemRating;

  Store.items({this.itemName, this.itemPrice, this.itemImage, this.itemRating});
}

List<Store> storeItems = [
  Store.items(
      itemName: "Khal",
      itemPrice: 2500.0,
      itemImage:
          "https://5.imimg.com/data5/LD/EI/MY-46292508/cotton-seed-cake-250x250.jpg",
      itemRating: 3.0),
  Store.items(
      itemName: "Churri",
      itemPrice: 1500,
      itemImage:
          "https://5.imimg.com/data5/DS/RO/MY-28762952/cattle-feed-masoor-churi-500x500.jpg",
      itemRating: 4.0),
  Store.items(
      itemName: "Tea",
      itemPrice: 2500.0,
      itemImage:
          "https://4.imimg.com/data4/EW/RB/MY-10317533/chai-patti-500x500.jpg",
      itemRating: 3.0),
  Store.items(
      itemName: "Peanuts",
      itemPrice: 2500.0,
      itemImage:
          "https://cgaxisimg.ams3.cdn.digitaloceanspaces.com/2017/03/cgaxis_models_73_04b.jpg",
      itemRating: 3.0),
];
