import 'package:ex_books/common/Repository.dart';
import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/category.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'each_book_card.dart';

class BookList extends StatefulWidget {
  User _user;

  BookList(this._user);

  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  DatabaseServices service = new DatabaseServices();
  List<Book> userBooks = new List<Book>();
  List<Categoreey> categories = new List<Categoreey>();

  @override
  void initState() {
    super.initState();
    if (widget._user == null) {
      fillBookData();
    } else {
      fillBooks();
    }
  }

  fillBooks() async {
    List<Book> user = await service.getBooks(widget._user.uid);
    List<Categoreey> cat = await service.getCategories();
    setState(() {
      userBooks = user;
      categories = cat;
    });
  }

  fillBookData() async {
    FirebaseUser cUser = await FirebaseAuth.instance.currentUser();
    List<Book> user = await service.getBooks(cUser.uid);
    List<Categoreey> cat = await service.getCategories();
    setState(() {
      userBooks = user;
      categories = cat;
    });
  }

  bookDeleted() {
    if (widget._user == null) {
      fillBookData();
    } else {
      fillBooks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => EachBook(
        book: userBooks[index],
        categories: categories,
        isProfile: widget._user == null ? true : false,
        bookDeleted: bookDeleted,
      ),
      itemCount: userBooks.length,
    );
  }
}
