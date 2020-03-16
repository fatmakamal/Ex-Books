import 'package:ex_books/common/Repository.dart';
import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/models/userDetails.dart';
import 'package:ex_books/screens/AddBookForm.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/shared/Rate.dart';
import 'package:ex_books/shared/book_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final DatabaseServices _database = DatabaseServices();
  bool loading = false;
  UserDetails currentUser = new UserDetails();
  String storagePath = '/data/user/0/com.example.ex_books/cache/';
  String total = "";
  String fullName = "";
  String defultImage = "img/selena.jpg";

  _ProfileState() {
    _populateCurrentUser();
  }

  String getImage(){
    return total == "" ? defultImage : total;
  }

  void _populateCurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    var _currentUser = await _database.getUser(user.uid);
    setState(() {
      currentUser = _currentUser;
      total = storagePath + currentUser.image;
      fullName = currentUser.firstName + ' ' + currentUser.lastName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Authservices _auth = Authservices();

    return StreamProvider<List<Book>>.value(
      value: DatabaseServices().books,
      child: Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(240, 140, 44, 10),
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.all(80.0),
                child: Text(
                  'EX Books',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              FlatButton(
                child: Text('Log Out'),
                onPressed: () async {
                  _auth.SignOut();
                },
              ),
            ],
          ),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Column(children: <Widget>[
              CircleAvatar(
                radius: 70,
                // maxRadius: 20.0,
                backgroundImage: AssetImage(
                  getImage() ,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(fullName,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ]),
              Rate(),
              SizedBox(
                height: 10,
              ),
            ]),
            Container(
              height: 6.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(23, 19, 17, 10),
                  Color.fromRGBO(240, 140, 44, 10)
                ],
              )),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: BookList(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  ClipOval(
                    child: Material(
                      color: Color.fromRGBO(23, 19, 17, 10),
                      child: InkWell(
                          splashColor: Color.fromRGBO(240, 140, 44, 10),
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddBookForm()));
                          }),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text('Add New Book',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(240, 140, 44, 10))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
