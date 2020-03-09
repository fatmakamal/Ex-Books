import 'package:ex_books/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/screens/home/home.dart';

import 'home/home.dart';
//import 'auth/auth.dart';

class wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    
    if(user==null)
       return Authenticate();
    else
       return Home();
  }
}