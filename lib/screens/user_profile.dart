import 'package:ex_books/models/book.dart';
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
 

   bool loading =false; 
  @override


  Widget build(BuildContext context) {
/*
String path = '/data/user/0/com.example.ex_books/cache/';
String total = path + userimage;*/
final Authservices _auth = Authservices();
var uid=_auth.getCurrentUser();
print(uid);


    return StreamProvider<List<Book>>.value(
          value: DatabaseServices().books,
          child: Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor: Color.fromRGBO(240, 140, 44, 10),
           title: Row(
               
                children: [

                Container(
                    padding:  EdgeInsets.all(80.0), child: Text('EX Books',style: TextStyle(fontSize:25),))
              ],

            ),
          elevation: 0.0,

        ) ,

        body: Column(
          children: <Widget>[
            SizedBox(height: 16,),
            Padding(
              padding:  EdgeInsets.fromLTRB(150,5, 150, 25),
              child: Column(
                children:<Widget>[
                   CircleAvatar(
                     radius: 70,
                     backgroundImage: AssetImage('img/profile.jpg',),
                   ),
                   SizedBox(height:16.0),
                   Container(
                     child: FittedBox(
                       fit: BoxFit.contain,
                       child:Text('Toqa EL Lithy',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),)),
                    SizedBox(height: 5,),
                    Rate(),   
                ]
              ),
            ),

            Container(
              height: 6.0,
              decoration: BoxDecoration(
                gradient:LinearGradient(
                  begin:Alignment.topLeft,
                  end:Alignment.bottomRight,
                  colors:[Color.fromRGBO(23, 19, 17, 10),Color.fromRGBO(240, 140, 44, 10)],
                )
              ),
            ),
            
            SizedBox(
              height: 20,
            ),

        Flexible(
          child: BookList(),
        ),


Container(
 padding: EdgeInsets.fromLTRB(10, 0, 0,55),
  child:   Row(
  
        mainAxisAlignment: MainAxisAlignment.start,
  
        children: <Widget>[
  
        SizedBox(width: 30,),
  
            ClipOval(
              child: Material(
              color: Color.fromRGBO(23, 19, 17, 10), 
                 child: InkWell(
                    splashColor:Color.fromRGBO(240, 140, 44, 10), 
                      child: SizedBox(width: 56, height: 56, child: Icon(Icons.add,color: Colors.white,)),
                      onTap: () {
                        Navigator.push(context,  MaterialPageRoute(builder: (context) => AddBookForm()));
                                }
                              ),
                            ),
                    ),
  
       SizedBox(width:15),
       Text('Add New Book',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Color.fromRGBO(240, 140, 44, 10))), 
  
      ],
  
  ),
),         
          ],
        ),
        ),
    );


    }
}



