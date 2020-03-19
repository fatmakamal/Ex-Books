
import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../category-books-screen/category-books-screen.dart';
import '../wrapper.dart';

class SplashScreen extends StatefulWidget {


  final Categoreey category;
  SplashScreen({this.category});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // Future<void> goToCategoriesBooksScreen(BuildContext context) async
  // {
  //   Navigator.push(context, MaterialPageRoute(builder: (context)
  //    =>
  //     CategoryBooksScreen(theIdOfSelectedCategory: widget.category.id, theTitleOfSelectedCategory: widget.category.title,)));

  // }
  void goTo(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>wrapper()) );
  }

  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 3),
    //  ()=>print('hello')
    ()=> goTo(context) 
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(240, 140, 44, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(200)
          ),
            child: Image.asset(
                 'img/logo.png',
                  fit: BoxFit.contain,
                  height: 42,
              ) ,),
              Container(
                margin: EdgeInsets.all(20),
                child: Text("Ex Books" ,style: TextStyle(color: Colors.white,fontSize: 40),),
              ),
          CircularProgressIndicator(),

      ],),

    ),);
  }
}