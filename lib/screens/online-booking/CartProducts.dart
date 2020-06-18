import 'package:ex_books/models/Cart.dart';
import 'package:ex_books/services/database.dart';
import 'package:flutter/material.dart';
import 'EachCartItem.dart';

class Cart_product extends StatefulWidget {
  int totalPrice = 0;
  final List<Cart> books;

  Cart_product({this.books});

  @override
  _Cart_productState createState() => _Cart_productState();
}

class _Cart_productState extends State<Cart_product> {
  DatabaseServices service = new DatabaseServices();
  @override
  Widget build(BuildContext context) {
    final cartItems = widget.books;
    int length = cartItems == null ? 0 : cartItems.length;
    for (int i = 0; i < length; i++) {
      widget.totalPrice = widget.totalPrice + cartItems[i].price;
    }

    return ListView.builder(
        itemCount: cartItems == null ? 0 : cartItems.length,
        itemBuilder: (BuildContext context, int index) => Single_cart_product(
              cartItem: cartItems[index],
              totalPrice: widget.totalPrice,
            ));
  }
}
