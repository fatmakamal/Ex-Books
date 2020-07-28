import 'package:ex_books/models/Cart.dart';
import 'package:ex_books/screens/online-booking/checkout.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/services/database.dart';
import 'package:flutter/material.dart';
import 'package:ex_books/screens/online-booking/CartProducts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'EachCartItem.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
  static void deleteItem(BuildContext context, String id) {
    _CartScreenState state =
        context.findAncestorStateOfType<_CartScreenState>();
    state.deleteitem(id);
  }
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> carts = new List<Cart>();
  DatabaseServices dbService = new DatabaseServices();
  Authservices userService = new Authservices();
  int totalPrice = 0;

  Future deleteitem(String docId) async {
    DatabaseServices service = new DatabaseServices();
    await service.deleteitem(docId);
    await getBooks();
  }

  List<String> getBookIds() {
    List<String> ids = carts.map((c) => c.documentId).toList();
    return ids;
  }

  getTotalPrice() {
    var sum = 0;
    for (var item in carts) {
      sum += item.price * item.quantity;
    }
    setState(() {
      totalPrice = sum;
    });
  }

  getBooks() async {
    var userId = await userService.getCurrentUser();
    dbService.getByUserId(userId.uid).then((val) => {
          setState(() {
            carts = val;
          }),
          getTotalPrice()
        });
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
        title: Text('Cart'),
      ),
      body: carts.length == 0
          ? SpinKitChasingDots(
              color: Color.fromRGBO(240, 140, 44, 10),
            )
          : Cart_product(
              books: carts,
            ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text('Total :  ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(240, 140, 44, 10))),
                subtitle: new Text(
                  this.totalPrice.toString(),
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Checkout(
                                bookIds: getBookIds(),
                                totalPrice: this.totalPrice,
                              )));
                },
                child: new Text('Check Out ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
