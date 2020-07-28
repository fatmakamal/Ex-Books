import 'package:ex_books/models/Online_books.dart';
import 'package:ex_books/services/upload_iamge.dart';
import 'package:flutter/material.dart';
import 'ProductDetails.dart';

class EachProductCard extends StatefulWidget {
  @override
  _EachProductCardState createState() => _EachProductCardState();

  final OnlineBook book;

  EachProductCard({this.book});
}

class _EachProductCardState extends State<EachProductCard> {
  UploadImage _imageService = new UploadImage();
  String imageURI = "";
  String defultImage = "img/defult.jpg";

  getImage() async {
    _imageService.getDownloadURI(widget.book.bookImage).then((value) => {
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
    // String path = '/data/user/0/com.example.ex_books/cache/';
    // String total = path + widget.book.bookImage;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Card(
        child: Hero(
          tag: widget.book.bookName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  //passing values of product to product details
                  builder: (context) => new ProductDetails(
                        product_detail_name: widget.book.bookName,
                        product_detail_picture: widget.book.bookImage,
                        product_detail_price: widget.book.price,
                        describtion: widget.book.describtion,
                        quantity: widget.book.quantity,
                      ))),
              child: GridTile(
                footer: Container(
                    color: Colors.black87,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(
                            widget.book.bookName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.6,
                                color: Color.fromRGBO(240, 140, 44, 10)),
                          ),
                        ),
                        new Text(
                          widget.book.price.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    )),
                child: imageURI == ""
                    ? Image.asset(defultImage, fit: BoxFit.cover)
                    : Image.network(imageURI, fit: BoxFit.cover),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
