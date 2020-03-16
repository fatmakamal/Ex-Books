import 'dart:io';

import 'package:ex_books/models/userDetails.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/services/upload_iamge.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ex_books/shared/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:path/path.dart';

class AddBookForm extends StatefulWidget {
  FileImage get bookImage => null;

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final UploadImage img = UploadImage();
  final DatabaseServices _database = DatabaseServices();
  final Authservices _auth = Authservices();
  final _formkey = GlobalKey<FormState>();
  List<String> categories = [
    'Action',
    'Romance',
    'Drama',
    'Science',
    'Education'
  ];
  String bookName = '';
  String authorName = '';
  File bookImage;
  String selectedCategory = 'Select Category';
  String describtion = '';
  bool loading = false;
  String error = '';

//---------------Controllers---------------------------------
  TextEditingController _bookNameController = TextEditingController();
  TextEditingController _authorNameController = TextEditingController();
  TextEditingController _bookImageController = TextEditingController();
  TextEditingController _bookDescriptionController = TextEditingController();
//----------------------------------------------------

 UserDetails  currentUser = new UserDetails();

_AddBookFormState (){
  _populateCurrentUser();
}

  void _populateCurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var _currentUser = await _database.getUser(user.uid);
    setState(() {
      currentUser = _currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'img/logo.png',
              fit: BoxFit.contain,
              height: 45,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'EX Books',
                ))
          ],
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Center(
                  child: Text("Add New Book",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _bookNameController,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Book Name', prefixIcon: Icon(Icons.book)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Book Name';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      bookName = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _authorNameController,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Author Name', prefixIcon: Icon(Icons.person)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Author Name';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      authorName = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _bookDescriptionController,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Describtion',
                      prefixIcon: Icon(Icons.text_fields)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Book Describtion';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      describtion = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                    validator: (String val) {
                      if (val?.isEmpty ?? true) {
                        return 'Choose a category';
                      }
                    },
                    hint: Text('$selectedCategory'),
                    items: categories.map((cat) {
                      return DropdownMenuItem(
                        value: cat,
                        child: Text('$cat '),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => selectedCategory = val)),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  onPressed: null,
                  child: Row(children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Color.fromRGBO(23, 19, 17, 10), // button color
                        child: InkWell(
                            splashColor: Color.fromRGBO(
                                240, 140, 44, 10), // inkwell color
                            child: SizedBox(
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                            onTap: () {
                              Alert(
                                  context: context,
                                  title: 'ALert',
                                  style: AlertStyle(
                                    titleStyle: TextStyle(fontSize: 0),
                                    animationType: AnimationType.fromTop,
                                    animationDuration:
                                        Duration(milliseconds: 400),
                                  ),
                                  content: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: null,
                                            child: Row(children: <Widget>[
                                              ClipOval(
                                                child: Material(
                                                  color: Color.fromRGBO(23, 19,
                                                      17, 10), // button color
                                                  child: InkWell(
                                                      splashColor: Color.fromRGBO(
                                                          240,
                                                          140,
                                                          44,
                                                          10), // inkwell color
                                                      child: SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child: Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          )),
                                                      onTap: () async {
                                                        bookImage =
                                                            await UploadImage()
                                                                .OpenGallery();
                                                      }),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text('Gallery',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          23, 19, 17, 10))),
                                            ]),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.0),
                                      Row(
                                        children: <Widget>[
                                          FlatButton(
                                            onPressed: null,
                                            child: Row(children: <Widget>[
                                              ClipOval(
                                                child: Material(
                                                  color: Color.fromRGBO(23, 19,
                                                      17, 10), // button color
                                                  child: InkWell(
                                                      splashColor: Color.fromRGBO(
                                                          240,
                                                          140,
                                                          44,
                                                          10), // inkwell color
                                                      child: SizedBox(
                                                          width: 40,
                                                          height: 40,
                                                          child: Icon(
                                                            Icons.camera,
                                                            color: Colors.white,
                                                          )),
                                                      onTap: () {
                                                        UploadImage()
                                                            .OpenCamera();
                                                        bookImage =
                                                            img.getter();
                                                      }),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Text('Camera',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          23, 19, 17, 10))),
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () async {
                                        print("the path is $bookImage");
                                        await _database.uploadPic(bookImage);
                                        Navigator.pop(context, true);
                                      },
                                      color: Color.fromRGBO(23, 19, 17, 10),
                                      width: 120,
                                    ),
                                  ]).show();
                            }),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text('Upload image',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(23, 19, 17, 10))),
                  ]),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Color.fromRGBO(23, 19, 17, 10),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.addNewBook(
                          bookName,
                          authorName,
                          basename(bookImage.path),
                          selectedCategory,
                          describtion,
                          currentUser.email,
                          currentUser.image);
                          print(currentUser.email);
                      if (result == null) {
                        setState(() {
                          error = 'could not submit';
                          loading = false;
                        });
                      } else {
                        Alert(
                            context: context,
                            title: 'ALert',
                            style: AlertStyle(
                              titleStyle: TextStyle(fontSize: 0),
                              animationType: AnimationType.fromTop,
                              animationDuration: Duration(milliseconds: 400),
                            ),
                            content: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.warning,
                                  color: Color.fromRGBO(180, 10, 3, 2),
                                  size: 47,
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Book Added Successfuly',
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(height: 9.0),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Ok",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  _bookNameController.clear();
                                  _bookDescriptionController.clear();
                                  _bookImageController.clear();
                                  _bookDescriptionController.clear();
                                  _authorNameController.clear();
                                  setState(() {
                                    selectedCategory = '';
                                    bookImage = null;
                                  });
                                  Navigator.pop(context, true);
                                },
                                color: Color.fromRGBO(23, 19, 17, 10),
                                width: 120,
                              ),
                            ]).show();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
