import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/Online_books.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/shared/main-drawer.dart';
import 'package:flutter/material.dart';
import 'package:ex_books/screens/online-booking/Categories.dart';
import 'package:ex_books/screens/online-booking/Products.dart';
import 'package:ex_books/screens/online-booking/Cart.dart';
import 'package:provider/provider.dart';

class OnlineHome extends StatefulWidget {
  @override
  _OnlineHomeState createState() => _OnlineHomeState();
}

class _OnlineHomeState extends State<OnlineHome> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<OnlineBook>>.value(
      value: DatabaseServices().onlineBooks,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 140, 44, 10),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.all(80.0),
                  child: Text(
                    'EX Books',
                    style: TextStyle(fontSize: 25),
                  )),
            ],
          ),
          actions: <Widget>[
            new IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new CartScreen()));
              },
            )
          ],
          elevation: 0.0,
        ),
        drawer: MainDrawer(),
        body: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(13.0),
            ),
            OnlineCategory(),
            Padding(
              padding: const EdgeInsets.all(20.0),
            ),
            Flexible(
              child: Products(),
            ),
          ],
        ),
      ),
    );
  }
}
