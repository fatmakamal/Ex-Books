import 'package:ex_books/common/Repository.dart';
import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'each_book_card.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  
  DatabaseServices service = new DatabaseServices();
  List<Book> userBooks = new List<Book>();

  @override
  void initState() {
    fillBookData();
  }

  fillBookData() async {
    FirebaseUser cUser = await FirebaseAuth.instance.currentUser();
    userBooks = await service.getBooks(cUser.uid);
  }

  @override
  Widget build(BuildContext context) {

//------------move the current user books from books list to user_books list-------------

    //  for (int i = 0; i < books.length; i++) {
    //     if(books[i].uid==id){
    //      user_books.add(books[i]);
    //                        }
    //           }

//-------------send user_books list to the builder to show them in the user profile----------

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => EachBook(
        book: userBooks[index],
      ),
      itemCount: userBooks.length,
    );
  }
}
