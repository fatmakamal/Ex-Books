import 'package:ex_books/screens/authenticate/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/shared/constants.dart';
import 'package:ex_books/shared/loading.dart';

class SignIn extends StatefulWidget {
  
  final Function toggleView;
  SignIn({this.toggleView});
  
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  final _formkey = GlobalKey<FormState>();
  final Authservices _auth = Authservices();
  String email='';
  String password='';
  String error='';
  bool loading =false;
  
  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
         title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Image.asset(
                 'img/logo.png',
                  fit: BoxFit.contain,
                  height: 42,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('EX Books',style: TextStyle(fontSize:25),))
            ],

          ),
        elevation: 0.0,

      ) ,

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child:ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(height: 40.0,),
              Image.asset(
                 'img/logo.png',
                  fit: BoxFit.contain,
                  height: 200,
              ),

              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) {
                  if (val.isEmpty) {
                        return 'Please enter valid email';
                                  }
                        return null;
                                }, 
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                 validator: (val) => val.length < 6 ? 'enter an password more than 6 chars' : null ,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },
              ),
           // SizedBox(height: 5.0,),
             
            FlatButton(
              textColor: Color.fromRGBO(240, 140, 44, 10),
              onPressed: (){
              Navigator.push(context,  MaterialPageRoute(builder: (context) => ResetPassword()));

              }, 
              child: Align(
               alignment: Alignment.topLeft,
               child: Text('Forget Your Password ?',style: TextStyle(color:Color.fromRGBO(240, 140, 44, 10)),)),
               ), 
            RaisedButton(
                color: Color.fromRGBO(23, 19, 17, 10),
                child: Text('Sign in',
                style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                
                ),
                onPressed: () async{
                  if(_formkey.currentState.validate()){
                      setState(() => loading=true);
                      dynamic result = await _auth.signInWithMailAndPassword(email, password);
                      if(result==null){
                        setState(() {
                          error='Email Or Password is incorrect';
                          loading=false;
                          });
                 }}
                },
              ),
              FlatButton.icon(
              label: Text('Crate New Account',style: TextStyle(fontSize:20),),
              textColor: Color.fromRGBO(240, 140, 44, 10),
              icon: Icon(Icons.person_add),
              onPressed: (){
                 widget.toggleView();
            },
               ),
            
            
            SizedBox(height: 3.0,),
            Text(error,
            style: TextStyle(color: Colors.red,fontSize: 14.0),
            ),
            ],
          ),
        ) ,
      ),
    );
  }
}