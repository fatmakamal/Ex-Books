import 'package:ex_books/services/upload_iamge.dart';
import 'package:path/path.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/shared/increase_button.dart';
import 'package:flutter/material.dart';
import 'package:ex_books/screens/online-booking/Online-home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_picture;
  final describtion;
  final quantity;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_picture,
    this.product_detail_price,
    this.describtion,
    this.quantity,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quan = 0;
  bool loading = false;
  final Authservices _auth = Authservices();
  int selctedQuantity = QuantityButton().current;
  UploadImage _imageService = new UploadImage();
  String imageURI = "";
  String defultImage = "img/defult.jpg";

  getImage() async {
    _imageService
        .getDownloadURI(widget.product_detail_picture)
        .then((value) => {
              this.setState(() {
                imageURI = value;
              })
            });
  }

  @override
  void initState() {
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new OnlineHome()));
          },
          child: Text('Ex Books', style: TextStyle(fontSize: 25)),
        ),
        actions: <Widget>[],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: imageURI == ""
                    ? Image.asset(defultImage)
                    : Image.network(imageURI),
              ),
              footer: Container(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                color: Colors.white70,
                child: ListTile(
                  leading: Text('Price ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(240, 140, 44, 10))),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //------------the first buttons---------
          Container(
            height: 20,
          ),
          Row(
            children: <Widget>[
              //------------Quantity button-----------

              Container(
                width: 20,
              ),
              Text("Quantity ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(240, 140, 44, 10))),
              Container(
                width: 20,
              ),
              Container(
                height: 25,
                width: 150,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    new FloatingActionButton(
                      heroTag: "bt1",
                      onPressed: () {
                        if (this.quan == widget.quantity) return;
                        setState(() {
                          quan++;
                        });
                      },
                      child: new Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.white,
                    ),
                    new Text(this.quan.toString(),
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.red)),
                    new FloatingActionButton(
                      onPressed: () {
                        if (this.quan == 0) return;
                        setState(() {
                          quan--;
                        });
                      },
                      heroTag: "bt2",
                      child: new Icon(
                          const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                          color: Colors.black),
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 20),
                Text('Add to Cart',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(240, 140, 44, 10))),
                SizedBox(width: 20),
                ClipOval(
                  child: Material(
                    color: Color.fromRGBO(23, 19, 17, 10),
                    child: InkWell(
                        splashColor: Color.fromRGBO(240, 140, 44, 10),
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.white,
                            )),
                        onTap: () async {
                          setState(() => loading = true);
                          dynamic result = await _auth.addToCart(
                              widget.product_detail_name,
                              basename(widget.product_detail_picture),
                              widget.product_detail_price,
                              this.quan);
                        }),
                  ),
                ),
              ],
            ),
          ),

          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
                child: Text('Book Name',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(240, 140, 44, 10))),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(
                  widget.product_detail_name,
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 1, 5.0, 5.0),
            child: new ListTile(
              title: Text('Book Discribtion',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(240, 140, 44, 10))),
              subtitle: new Text(
                widget.describtion,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
