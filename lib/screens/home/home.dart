import 'package:ex_books/services/Auth.dart';
import 'package:flutter/material.dart';

import '../user_profile.dart';

//import 'package:ex_books/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  @override
  
  final Authservices _auth =Authservices();

  
  Widget build(BuildContext context) {






    return  Scaffold(
        
        backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor:  Color.fromRGBO(240, 140, 44, 10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Image.asset(
                 'img/logo.png',
                  fit: BoxFit.contain,
                  height: 42,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('EX Books',style: TextStyle(fontSize:25),)),
             
              Container(
                 padding: EdgeInsets.all(5),
                 width: 58,
                 child: InkWell(
                    onTap: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('img/profile.jpg',),
                    backgroundColor: Colors.black38,
                     ),
                 ),
              ),
              ],

          ),

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