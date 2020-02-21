import 'package:ex_books/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/shared/constants.dart';
import 'package:ex_books/shared/loading.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
 
  final _formkey = GlobalKey<FormState>();
  final Authservices _auth = Authservices();
  String email='';
  String error='';
  bool loading =false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading():Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
         title: 
             
                // padding: const EdgeInsets.all(8.0), 
                 Text('Reset Password',
                         style: TextStyle(fontSize:25),
                         textAlign: TextAlign.center,),
                         
             
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

              SizedBox(height: 25.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) {
                  if (val.isEmpty||!val.contains('@')) {
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
             
           
             
            RaisedButton(
                color: Color.fromRGBO(23, 19, 17, 10),
                child: Text('Submit',
                style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                
                ),
                onPressed: () {
                  _auth.sendPasswordResetEmail(email);  
                  return Alert(
          context: context,
          title: 'ALert',
          style: AlertStyle(
            titleStyle:TextStyle(fontSize: 0),
            animationType: AnimationType.fromTop,
            animationDuration: Duration(milliseconds: 400),
            isCloseButton: false,
            isOverlayTapDismiss: false,
          ),
          content: Column(
                children: <Widget>[
                  
                  Icon(Icons.warning,color: Color.fromRGBO(180, 10, 3, 2),size: 47,),
                  SizedBox(height: 20.0),
                  Text('A password reset Link has been sent to $email',style: TextStyle(fontSize:17),),
                  SizedBox(height: 9.0),
              ],
              
              ),
            
            buttons: [
               DialogButton(
                  child: Text(
                          "Ok",
                         style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    onPressed: () {
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => SignIn()));
                    },
                       color: Color.fromRGBO(23, 19, 17, 10),
                       width: 120,
                        ),
            ] 
              ).show();
                },
              ),
              
               
            
            
            SizedBox(height: 12.0,),
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