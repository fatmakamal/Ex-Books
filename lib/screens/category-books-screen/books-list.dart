
import 'package:ex_books/models/Book.dart';
import 'package:ex_books/screens/category-books-screen/book-item.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/shared/book_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/category.dart';

class BooksList extends StatefulWidget {
  final String theTitleOfSelectedCategory ;
  BooksList(this.theTitleOfSelectedCategory);
  
  @override
  _BooksListState createState() => _BooksListState(theTitleOfSelectedCategory);
}

class _BooksListState extends State<BooksList> {

  final String theTitleOfSelectedCategory;
  _BooksListState(this.theTitleOfSelectedCategory);
  
  @override
  Widget build(BuildContext context) {
    final books = Provider.of<List<Book>>(context);

    final categoryBooks = books.where((book) {
      return book.selectedCategory == theTitleOfSelectedCategory;
    }).toList();

    

    // categories.forEach((Categoreey){
    //   // print("this is Id ${Categoreey.id} , this is title ${Categoreey.title}");
    // });
return ListView.builder(
  
          itemCount: categoryBooks.length,
 itemBuilder: (context,index){
        return BookItem(book: categoryBooks[index], );
    }
 );



  }
}