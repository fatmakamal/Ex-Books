import 'package:ex_books/services/Auth.dart';
import 'package:flutter/material.dart';

//import 'package:ex_books/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  @override
  
  final Authservices _auth =Authservices();

  
  Widget build(BuildContext context) {






    return  Scaffold(
        
        backgroundColor: Colors.brown[100],
        appBar:AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Home page'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Log Out'),
              onPressed: () async{
                await _auth.SignOut();
              },
            ),
            
          ],
        ) ,


     
    );
  }
}