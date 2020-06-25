
import 'package:ex_books/models/Online_books.dart';
import 'package:ex_books/screens/online-booking/EachProduct.dart';
import 'package:ex_books/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Products> {
   DatabaseServices service = new DatabaseServices();
  List<OnlineBook> userBooks = new List<OnlineBook>();

   /* fillBookData() async {
    FirebaseUser cUser = await FirebaseAuth.instance.currentUser();
    List<Book> user = await service.getBooks(cUser.uid);
    
    setState(() {
      userBooks = user;
     
    });
  }*/

  @override
  Widget build(BuildContext context) {
 //fillBookData();
    final userBooks= Provider.of<List<OnlineBook>>(context);

    return GridView.builder(
      itemCount: userBooks == null ? 0 :userBooks.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2 ),
      itemBuilder: (BuildContext context,int index) => EachProductCard(
        book: userBooks[index],
      )


       );
  }
}

