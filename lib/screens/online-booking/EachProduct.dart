import 'package:ex_books/models/Online_books.dart';
import 'package:flutter/material.dart';
import 'ProductDetails.dart';

class EachProductCard extends StatelessWidget {

  final OnlineBook book;
 
    EachProductCard({
           this.book
         });

  @override
  Widget build(BuildContext context) {
    String path = '/data/user/0/com.example.ex_books/cache/';
    String total = path + book.bookImage;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
          child: Card(
         child: Hero(
             tag: book.bookName,
             child: Material(
               child: InkWell(onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
              //passing values of product to product details   
                 builder:(context) =>new ProductDetails(
                   product_detail_name: book.bookName,
                   product_detail_picture: total ,
                   product_detail_price: book.price,
                   describtion: book.describtion,
                   quantity:book.quantity,
                 ))),
               child: GridTile(
                 footer:Container(
                   color: Colors.black87,
                   child: new Row(
                     children: <Widget>[
                       Expanded(
                         child: new Text(book.bookName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.6,color: Color.fromRGBO(240, 140, 44, 10)),),
                       ),
                       new Text("\$${book.price}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                     ],
                   )
                 ),
                 child: Image.asset(total,
                 fit:BoxFit.cover),
                 
                 ),
                 ),
             ),


         ),
      ),
    );
  }
}