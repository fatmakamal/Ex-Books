import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/screens/wrapper.dart';
import 'package:ex_books/services/Auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
       value: Authservices().user,  
       child: MaterialApp(
       home: wrapper(),
      ),
    );
  }
}

