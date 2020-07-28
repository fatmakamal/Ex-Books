import 'package:ex_books/models/Cart.dart';
import 'package:ex_books/screens/online-booking/Cart.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/services/upload_iamge.dart';
import 'package:flutter/material.dart';

class Single_cart_product extends StatefulWidget {
  @override
  _Single_cart_productState createState() => _Single_cart_productState();
  final Cart cartItem;
  final int totalPrice;
  Single_cart_product({this.cartItem, this.totalPrice});
}

class _Single_cart_productState extends State<Single_cart_product> {
  UploadImage _imageService = new UploadImage();
  String defultImage = "img/defult.jpg";
  String imageURI = "";

  @override
  initState() {
    super.initState();
    getImage();
  }

  getImage() {
    _imageService.getDownloadURI(widget.cartItem.bookImage).then((val) => {
          setState(() {
            imageURI = val;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    // String path = '/data/user/0/com.example.ex_books/cache/';
    // String total = path + widget.cartItem.bookImage;

    return Card(
      child: Container(
          height: 100.0,
          child: ListTile(
            leading: imageURI == ""
                ? Image.asset(this.defultImage, width: 80.0, height: 80.0)
                : Image.network(this.imageURI, width: 80.0, height: 80.0),
            title: Row(
              children: <Widget>[
                Text('Book Name : ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(240, 140, 44, 10))),
                Text(widget.cartItem.bookName),
              ],
            ),
            subtitle: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    //---------------------- product Quantity--------------------------------

                    new Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text('Quantity : ',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(240, 140, 44, 10))),
                    ),

                    Container(
                      child: Text(
                        "${widget.cartItem.quantity}",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                    Container(
                      width: 65,
                    ),
                    FlatButton.icon(
                        onPressed: () {
                          CartScreen.deleteItem(
                              context, widget.cartItem.documentId);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Color.fromRGBO(23, 19, 17, 1),
                        ),
                        label: Text(''))
                  ],
                ),
                //--------------------------product price-------------------------

                Row(
                  children: <Widget>[
                    Text('Price : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(240, 140, 44, 10))),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "\$${widget.cartItem.price}",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
