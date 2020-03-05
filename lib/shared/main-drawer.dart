import 'package:ex_books/services/Auth.dart';

import 'package:flutter/material.dart';

import '../screens/user_profile.dart';
class MainDrawer extends StatelessWidget {
  @override
    final Authservices _auth =Authservices();

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            color: Color.fromRGBO(240, 140, 44, 10),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 35, bottom: 20 , left: 20 , right: 20 ),
            child: 
            ListTile(
              leading: Image.asset(
                 'img/logo.png',
                  fit: BoxFit.contain,
                  height: 42,
              ) ,
              title: Text(
              'EX Books !',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ) ,
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
            title: Text('Home' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.amber) ,),
            onTap: (){
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
            title: Text('Profile' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.amber) ,),
            onTap: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => Profile()));
                    },
          ),
          //----------------------------

          //---- Chats ListTile ---------------------
          ListTile(
            leading: Icon(
              Icons.chat,
              size: 24,
            ),
            title: Text('Chats' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.amber) ,),
            onTap: ()=> null,
          ),
          //----------------------------

          SizedBox(
            height: 220,
          ),

          //-----logout ListTile ---------------------
          ListTile(
            leading: Icon(
              Icons.reply_all,
              size: 24,
            ),
            title: Text('LogOut !' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.amber) ,),
            onTap: () async{
                await _auth.SignOut();
              },
          ),
          //----------------------------

          //-----contact us ListTile ---------------------
          ListTile(
            leading: Icon(
              Icons.call,
              size: 24,
            ),
            title: Text('Contact Us' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.amber) ,),
            onTap: ()=> null,
          ),
          //----------------------------
        ],
      ),
    );
  }
}
