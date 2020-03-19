
import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/screens/category-books-screen/book-item.dart';
import 'package:ex_books/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class BooksList extends StatefulWidget {
  final String theIdOfSelectedCategory ;
  BooksList(this.theIdOfSelectedCategory);
  
  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {

    DatabaseServices service = new DatabaseServices();
      List<User> userss = new List<User>();

      bool isLoading = false;

      fillData() async {
    List<User> userr = await service.getUsers();
    setState(() {
      userss = userr ;
      
    });
  }




  @override
  Widget build(BuildContext context) {
    final books = Provider.of<List<Book>>(context);

//---------check if the id of each book category is equal to the id of selected category or not
    final categoryBooks = books.where((book) {
      return book.selectedCategory == widget.theIdOfSelectedCategory;
    }).toList();

    

    // categories.forEach((Categoreey){
    //   // print("this is Id ${Categoreey.id} , this is title ${Categoreey.title}");
    // });

    fillData();
return ListView.builder(
  
          itemCount: categoryBooks.length,
 itemBuilder: (context,index){
        return BookItem(book: categoryBooks[index], users : userss );
    }
 );



  }
}