import 'package:GroceryCart/Tools/Store.dart';
import 'package:GroceryCart/UserScreens/AboutUs.dart';
import 'package:GroceryCart/UserScreens/ItemDetails.dart';
import 'package:GroceryCart/UserScreens/Profile.dart';
import 'package:GroceryCart/Tools/authentication.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'Favourites.dart';
import 'messages.dart';
import 'Cart.dart';
import 'OrderNotifications.dart';
import 'History.dart';
import 'Delivery.dart';
import 'Profile.dart';
import 'AboutUs.dart';
import 'ItemDetails.dart';
import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //BuildContext context;
  @override
  Widget build(BuildContext context) {
    //this.context = context;
    Widget imageCarousel = new Container(
      height: 100.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('Images/C3.jpg'),
          AssetImage('Images/C2.jpg'),
          AssetImage('Images/C1.png'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 4.0,
      ),
    );
    final FirebaseDatabase _database = FirebaseDatabase.instance;

    // bool _isEmailVerified = false;
    // void _showVerifyEmailSentDialog() {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       // return object of type Dialog
    //       return AlertDialog(
    //         title: new Text("Verify your account"),
    //         content:
    //             new Text("Link to verify account has been sent to your email"),
    //         actions: <Widget>[
    //           new FlatButton(
    //             child: new Text("Dismiss"),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    // void _resentVerifyEmail() {
    //   widget.auth.sendEmailVerification();
    //   _showVerifyEmailSentDialog();
    // }

    // void _showVerifyEmailDialog() {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       // return object of type Dialog
    //       return AlertDialog(
    //         title: new Text("Verify your account"),
    //         content:
    //             new Text("Please verify account in the link sent to email"),
    //         actions: <Widget>[
    //           new FlatButton(
    //             child: new Text("Resent link"),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //               _resentVerifyEmail();
    //             },
    //           ),
    //           new FlatButton(
    //             child: new Text("Dismiss"),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    // void _checkEmailVerification() async {
    //   _isEmailVerified = await widget.auth.isEmailVerified();
    //   if (!_isEmailVerified) {
    //     _showVerifyEmailDialog();
    //   }
    // }

    signOut() async {
      try {
        await widget.auth.signOut();
        widget.logoutCallback();
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Swadesh-E-Haat',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyFavourites(),
                ),
              );
            },
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AppMessages(),
                    ),
                  );
                },
              ),
              CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.red,
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            imageCarousel,
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'All Products',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: storeItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ItemDetails(
                            itemImage: storeItems[index].itemImage,
                            itemName: storeItems[index].itemName,
                            itemPrice: storeItems[index].itemPrice,
                            itemRating: storeItems[index].itemRating,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Stack(
                        alignment: FractionalOffset.topLeft,
                        children: <Widget>[
                          Stack(
                            alignment: FractionalOffset.bottomCenter,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image: NetworkImage(
                                        storeItems[index].itemImage),
                                  ),
                                ),
                              ),
                              Container(
                                height: 35.0,
                                color: Colors.black.withAlpha(100),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "${storeItems[index].itemName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "₹${storeItems[index].itemPrice}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 30.0,
                                width: 60.0,
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.brown,
                                      size: 20.0,
                                    ),
                                    Text(
                                      "${storeItems[index].itemRating}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.brown,
                                  ),
                                  onPressed: null),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 50.0,
            // ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyAppCart(),
                ),
              );
            },
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.red,
            child: Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Hemang'),
              accountEmail: Text('hemangmaan@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              leading: CircleAvatar(
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text('Order Notification'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyOrderNotifications(),
                  ),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              leading: CircleAvatar(
                child: Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text('Order History'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyOrderHistory(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text('Profile Settings'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyProfile(),
                  ),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
              leading: CircleAvatar(
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text('Delivery Address'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyDeliveryAddress(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              trailing: CircleAvatar(
                child: Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs(),
                  ),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              trailing: CircleAvatar(
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: Text('Logout'),
              onTap: () {
                signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
