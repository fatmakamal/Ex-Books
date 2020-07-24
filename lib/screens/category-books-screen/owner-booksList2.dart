import 'package:ex_books/models/Book.dart';
import 'package:ex_books/screens/category-books-screen/owner-book.dart';
import 'package:ex_books/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnerbooksList2 extends StatefulWidget {

  final String userFullName;
  final String userImg ;
  final String userId;

  OwnerbooksList2({this.userFullName,this.userImg,this.userId});
  @override
  _OwnerbooksList2State createState() => _OwnerbooksList2State();
}

class _OwnerbooksList2State extends State<OwnerbooksList2> {

      DatabaseServices service = new DatabaseServices();




  @override
  Widget build(BuildContext context) {

    final books = Provider.of<List<Book>>(context);

//---------check if the id of each book category is equal to the id of selected category or not
    final ownerBooks = books.where((book) {
      return book.uid == widget.userId;
    }).toList();


    return ListView.builder(
  
          itemCount: ownerBooks.length,
          itemBuilder: (context,index){
   
        return OwnerBook(book: ownerBooks[index],);
    }
 );
  }
}