import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/screens/category-books-screen/book-item.dart';
import 'package:ex_books/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class BooksList extends StatefulWidget {
  final String theIdOfSelectedCategory;
  BooksList(this.theIdOfSelectedCategory);

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  DatabaseServices service = new DatabaseServices();
  List<User> userss = new List<User>();
  bool dataInprogress = true;
  // List<String> suggestion = new List<String>();

  bool isLoading = false;

  fillData() async {
    service.getUsers().then((value) => {
          setState(() {
            userss = value;
            dataInprogress = false;
          })
        });
  }

  bool listFiltered = false;
  List<Book> list = new List<Book>();
  searchChanged(String value, List<Book> categoryBooks) {
    if (value != "") {
      setState(() {
        list = categoryBooks
            .where((element) =>
                element.bookName.toLowerCase().contains(value.toLowerCase()))
            .toList();
        listFiltered = true;
      });
    } else {
      setState(() {
        listFiltered = false;
      });
    }
  }

  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    final books = Provider.of<List<Book>>(context);

//---------check if the id of each book category is equal to the id of selected category or not
    final categoryBooks = books != null
        ? books.where((book) {
            return book.selectedCategory == widget.theIdOfSelectedCategory;
          }).toList()
        : new List<Book>();

    final List<String> suggestion = books != null
        ? books.map((e) {
            return e.bookName;
          }).toList()
        : new List<String>();

    fillData();
    return dataInprogress
        ? SpinKitChasingDots(
            color: Color.fromRGBO(240, 140, 44, 10),
          )
        : Column(
            children: [
              Container(
                  padding: EdgeInsets.all(5.0),
                  width: 400.0,
                  child: SimpleAutoCompleteTextField(
                      decoration: new InputDecoration(
                        hintText: "Search Space Part",
                        suffixIcon: new Icon(Icons.search),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      textChanged: (value) {
                        searchChanged(value, categoryBooks);
                      },
                      key: key,
                      suggestions: suggestion)),
              Expanded(
                child: ListView.builder(
                    itemCount: listFiltered ? list.length : categoryBooks.length ?? 0,
                    itemBuilder: (context, index) {
                      return listFiltered
                          ? BookItem(
                              book: list[index],
                              users: userss,
                            )
                          : BookItem(
                              book: categoryBooks[index],
                              users: userss,
                            );
                    }),
              ),
            ],
          );
  }
}
