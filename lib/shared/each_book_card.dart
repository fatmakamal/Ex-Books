import 'dart:io';
import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/category.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/services/upload_iamge.dart';
import 'package:flutter/material.dart';

class EachBook extends StatefulWidget {
  Book book;
  final String bookId;
  final List<Categoreey> categories;

  @override
  _EachBookState createState() => _EachBookState();

  EachBook({this.book, this.categories, this.bookId});
}

class _EachBookState extends State<EachBook> {
  String defultImage = "img/defult.jpg";
  String bookImage = '';
  Book _book = new Book();
  List<Categoreey> _categories = new List<Categoreey>();
  UploadImage _imageService = new UploadImage();

  getImage() async {
    if (_book.bookName == null) return;
    _imageService.getDownloadURI(_book.bookImage).then((value) => {
          setState(() {
            bookImage = value;
          })
        });
  }

  @override
  // // ignore: must_call_super
  void initState() {
    super.initState();
    setState(() {
      _book = widget.book;
      _categories = widget.categories;
    });
    getImage();
  }

  Future deletebook(String docId) async {
    DatabaseServices service = new DatabaseServices();
    await service.deleteBook(docId);
    return;
  }

  @override
  Widget build(BuildContext context) {
    // String path = '/data/user/0/com.example.ex_books/cache/';
    // String total = path + book.bookImage;

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: InkWell(
        onTap: () {
          showGeneralDialog(
              barrierColor: Colors.black.withOpacity(0.5),
              transitionBuilder: (context, a1, a2, widget) {
                return Transform.scale(
                  scale: a1.value,
                  child: Opacity(
                    opacity: a1.value,
                    child: AlertDialog(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      content: Container(
                        height: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Book Name ',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(height: 5),
                            Text(
                              _book.bookName, //book.bookName,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Book Category',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(height: 5),
                            Text(
                              _categories
                                  .firstWhere(
                                      (cat) => cat.id == _book.selectedCategory)
                                  .title,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Book Description ',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(height: 5),
                            Container(
                                width: 230,
                                child: Text(
                                  _book.describtion,
                                  style: TextStyle(fontSize: 16),
                                )),
                            SizedBox(height: 20),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: FlatButton.icon(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Color.fromRGBO(23, 19, 17, 1),
                                  ),
                                  label: Text('Delete Book'),
                                  textColor: Colors.black,
                                  onPressed: () async {
                                    await deletebook(_book.documentId);
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              transitionDuration: Duration(milliseconds: 200),
              barrierDismissible: true,
              barrierLabel: '',
              context: context,
              pageBuilder: (context, animation1, animation2) {
                return null;
              });
        },
        child: Container(
          width: 180.0,
          height: 180.0,
          child: ListTile(
            title: bookImage != ''
                ? Image.network(
                    bookImage,
                    width: 180.0,
                    height: 180.0,
                  )
                : Image.asset(
                    defultImage,
                    width: 180.0,
                    height: 180.0,
                  ),
          ),
        ),
      ),
    );
  }
}
