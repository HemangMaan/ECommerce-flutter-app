import 'package:flutter/material.dart';
import 'Favourites.dart';
import 'messages.dart';
import 'Cart.dart';
import 'OrderNotifications.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //BuildContext context;
  @override
  Widget build(BuildContext context) {
    //this.context = context;
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
        child: Text(
          'My HomePage Store',
          style: TextStyle(fontSize: 25.0),
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
              title: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
