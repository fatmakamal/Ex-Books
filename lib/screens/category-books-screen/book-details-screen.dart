import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/screens/category-books-screen/profile-of-book-owner.dart';
import 'package:ex_books/screens/chat-screens/screens/chat-screen.dart';
import 'package:ex_books/services/upload_iamge.dart';
import 'package:ex_books/shared/main-drawer.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;
  final User user;

  BookDetailsScreen({
    this.book,
    this.user,
  });
  @override
  _BookDetailsScreenState createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  String userImage = "";
  String bookImage = "";
  String defultImage = "img/defult.jpg";
  UploadImage _imageService = new UploadImage();

  @override
  initState() {
    super.initState();
    getBookImage();
    getUserImage();
  }

  getBookImage() async {
    _imageService.getDownloadURI(widget.book.bookImage).then((val) => {
          setState(() {
            bookImage = val;
          })
        });
  }

  getUserImage() async {
    _imageService.getDownloadURI(widget.user.image).then((res) => {
          setState(() {
            userImage = res;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    callAlertDialog(
      BuildContext context,
    ) {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Number"),
            content: Text(widget.user.phonenumber),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text("ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.bookName),
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 15),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child: InkWell(
                            child: CircleAvatar(
                              backgroundImage: userImage == ''
                                  ? AssetImage(
                                      defultImage,
                                    )
                                  : NetworkImage(userImage),
                            ),
                            onTap: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileOfBookOwnerScreen(
                                                user: widget.user,
                                              )))
                                }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          widget.user.firstname + " " + widget.user.lastname,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.amber,
                  child: Container(
                    child: bookImage == ""
                        ? Image.network(
                            'https://hpmedia.bloomsbury.com/rep/s/9781408855959_309031.jpeg',
                            fit: BoxFit.cover,
                          )
                        : Image.network(bookImage, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Author Name :',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            widget.book.authorName,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //----------------describtion title container --------
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Describtion',
                style: Theme.of(context).textTheme.title,
              ),
            ),

            //----------describtion container ----------
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: Container(
                height: 130,
                width: 330,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: Text(
                  widget.book.describtion,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
            ),
            //-----------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //-------------chat raised button----------
                  RaisedButton.icon(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      },
                      icon: Icon(
                        Icons.chat,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Chat',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  //------------------------
                  //--------call raised button------------

                  RaisedButton.icon(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        callAlertDialog(context);
                      },
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Call',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  //------------------------
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
