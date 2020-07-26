//import 'package:ex_books/screens/online-booking/AddOnlinebook.dart';
import 'package:ex_books/screens/chat-screens/screens/chat-screen.dart';
import 'package:ex_books/screens/online-booking/Online-home.dart';
import 'package:ex_books/screens/online-booking/addOnlineBook.dart';
import 'package:ex_books/services/Auth.dart';

import 'package:flutter/material.dart';

import '../screens/user_profile.dart';
import 'animated_popUp.dart';

class MainDrawer extends StatelessWidget {
  @override
  final Authservices _auth = Authservices();

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            color: Color.fromRGBO(240, 140, 44, 10),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 35, bottom: 20, left: 20, right: 20),
            child: ListTile(
              leading: Image.asset(
                'img/logo.png',
                fit: BoxFit.contain,
                height: 42,
              ),
              title: Text(
                'EX Books !',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //---------------home listTile--------
          ListTile(
            leading: Icon(
              Icons.home,
              size: 24,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.amber),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          //---------------------
          //-----profile ListTile ---------------------
          ListTile(
            leading: Icon(
              Icons.person,
              size: 24,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.amber),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),

          //-----Online ListTile ---------------------
          ListTile(
            leading: Icon(
              Icons.shopping_basket,
              size: 24,
            ),
            title: Text(
              'Online Store',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.amber),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnlineHome()));
            },
          ),
          //----------------------------

          //---- Chats ListTile ---------------------
          ListTile(
            leading: Icon(
              Icons.chat,
              size: 24,
            ),
            title: Text(
              'Chats',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.amber),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
            },
          ),
          //----------------------------

          //-----contact us ListTile ---------------------
          ListTile(
            leading: Icon(
              Icons.call,
              size: 24,
            ),
            title: Text(
              'Contact Us',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.amber),
            ),
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
                              height: 160,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      height: 50,
                                      width: 50,
                                      child: Image(
                                          image:
                                              AssetImage('img/contactus.png'))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.mail,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'exbooksManage@gmail.com ',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.call,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "01112184663",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                  transitionDuration: Duration(milliseconds: 200),
                  barrierDismissible: true,
                  barrierLabel: '',
                  context: context,
                  pageBuilder: (context, animation1, animation2) {
                    return null;
                  });
            },
          ),
          //----------------------------

          //-----logout ListTile ---------------------
          ListTile(
            leading: Icon(
              Icons.reply_all,
              size: 24,
            ),
            title: Text(
              'LogOut !',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.amber),
            ),
            onTap: () async {
              await _auth.SignOut();
            },
          ),
          //----------------------------
        ],
      ),
    );
  }
}
