import 'package:autocomplete_textfield/autocomplete_textfield.dart';
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
  initState() {
    super.initState();
  }

  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  bool listFiltered = false;
  List<OnlineBook> list = new List<OnlineBook>();
  searchChanged(String value, List<OnlineBook> categoryBooks) {
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

  @override
  Widget build(BuildContext context) {
    final userBooks = Provider.of<List<OnlineBook>>(context);

    final List<String> suggestion = userBooks != null
        ? userBooks.map((e) {
            return e.bookName;
          }).toList()
        : new List<String>();

    return Column(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 10.0),
            width: 400.0,
            child: SimpleAutoCompleteTextField(
                decoration: new InputDecoration(
                  hintText: "Search Space Part",
                  suffixIcon: new Icon(Icons.search),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                textChanged: (value) {
                  searchChanged(value, userBooks);
                },
                key: key,
                suggestions: suggestion)),
        Expanded(
          child: GridView.builder(
              itemCount: listFiltered
                  ? list.length
                  : userBooks == null ? 0 : userBooks.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) => EachProductCard(
                    book: listFiltered ? list[index] : userBooks[index],
                  )),
        ),
      ],
    );
  }
}
