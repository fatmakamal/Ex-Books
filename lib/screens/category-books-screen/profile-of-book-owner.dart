import 'package:ex_books/models/user.dart';
import 'package:ex_books/screens/category-books-screen/owner-booksList.dart';
import 'package:ex_books/services/upload_iamge.dart';
import 'package:ex_books/shared/book_list.dart';
import 'package:flutter/material.dart';

class ProfileOfBookOwnerScreen extends StatefulWidget {
  // final String userFullName;
  // final String userImg;
  // final String userId;
  final User user;

  ProfileOfBookOwnerScreen({this.user});

  @override
  _ProfileOfBookOwnerScreenState createState() =>
      _ProfileOfBookOwnerScreenState();
}

class _ProfileOfBookOwnerScreenState extends State<ProfileOfBookOwnerScreen> {
  UploadImage _imageService = new UploadImage();
  String userImage = "";
  String defultImage = "img/defult.jpg";

  @override
  void initState() {
    super.initState();
    getUserImage();
  }

  getUserImage() {
    _imageService.getDownloadURI(widget.user.image).then((res) => {
          setState(() {
            userImage = res;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  padding: const EdgeInsets.all(80.0),
                  child: Text(
                    'EX Books',
                    style: TextStyle(fontSize: 25),
                  )),
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
                backgroundImage: userImage == ''
                    ? AssetImage(defultImage)
                    : NetworkImage(
                        userImage,
                      ),
              ),
              SizedBox(height: 16.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.user.firstname,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ]),
              SizedBox(
                height: 15,
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
              child: BookList(widget.user),
            ),
          ],
        ),
    );
  }
}