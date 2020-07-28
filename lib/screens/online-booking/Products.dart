import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:ex_books/models/Online_books.dart';
import 'package:ex_books/screens/online-booking/EachProduct.dart';
import 'package:ex_books/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Products> {
  DatabaseServices service = new DatabaseServices();
  // List<OnlineBook> userBooks = new List<OnlineBook>();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  bool isListFiltered = false;
  List<OnlineBook> filteredList = new List<OnlineBook>();
  List<OnlineBook> bookList = new List<OnlineBook>();
  List<String> suggestion = new List<String>();
  /* fillBookData() async {
    FirebaseUser cUser = await FirebaseAuth.instance.currentUser();
    List<Book> user = await service.getBooks(cUser.uid);
    
    setState(() {
      userBooks = user;
     
    });
  }*/
  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    service.getOnlineBook().then((value) => {
          this.setState(() {
            bookList = value;
            suggestion = bookList.map((e) {
              return e.bookName;
            }).toList();
          })
        });
  }

  searchChanged(String value) {
    if (value != "") {
      setState(() {
        filteredList = bookList
            .where((element) =>
                element.bookName.toLowerCase().contains(value.toLowerCase()))
            .toList();
        isListFiltered = true;
      });
    } else {
      setState(() {
        isListFiltered = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final userBooks = Provider.of<List<OnlineBook>>(context);

    return Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 50.0),
            width: 400.0,
            child: SimpleAutoCompleteTextField(
              decoration: new InputDecoration(
                hintText: "Search Books",
                suffixIcon: new Icon(Icons.search),
                hintStyle: TextStyle(color: Colors.grey),
              ),
              key: key,
              suggestions: suggestion,
              textChanged: (value) {
                searchChanged(value);
              },
              textSubmitted: (value) {
                searchChanged(value);
              },
            )),
        bookList.length != 0
            ? Expanded(
                child: GridView.builder(
                    itemCount: isListFiltered
                        ? filteredList.length
                        : bookList == null ? 0 : bookList.length,
                    gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) =>
                        EachProductCard(
                          book: isListFiltered
                              ? filteredList[index]
                              : bookList[index],
                        )),
              )
            : SpinKitChasingDots(
                color: Color.fromRGBO(240, 140, 44, 10),
              ),
      ],
    );
  }
}
