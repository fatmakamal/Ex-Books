import 'package:ex_books/models/Book.dart';
import 'package:flutter/material.dart';

class OwnerBook extends StatelessWidget {
  final Book book;
  OwnerBook({this.book});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,

      child: Text(book.bookName),
      
    );
  }
}