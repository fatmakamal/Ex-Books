import 'dart:io';
import 'package:path/path.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/services/upload_iamge.dart';
import 'package:flutter/material.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/shared/constants.dart';
import 'package:ex_books/shared/loading.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Register extends StatefulWidget {
  
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final UploadImage img = UploadImage();
  final DatabaseServices _database = DatabaseServices();
  final _formkey = GlobalKey<FormState>();
  final Authservices _auth = Authservices();
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String email='';
  String password='';
  String confirmedPassword = '';
   File image;
  String error='';
  bool loading =false;
  
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor:Color.fromRGBO(240, 140, 44, 10),
        title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Image.asset(
                 'img/logo.png',
                  fit: BoxFit.contain,
                  height: 45,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('EX Books',))
            ],

          ),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person,color: Color.fromRGBO(23, 19, 17, 10),),
            label: Text('Sign In'),
            textColor: Colors.white,
            onPressed: (){
              widget.toggleView();
            },
          ),

        ],
      ) ,

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
        child: Form(
          key: _formkey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                inputFormatters: [
                   WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                   BlacklistingTextInputFormatter(RegExp("[0-10]")),],
                decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                validator: (val) => val.isEmpty? 'Enter your First Name' : null ,
                onChanged: (val){
                  setState(() {
                    firstName=val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                inputFormatters: [
                   WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),
                   BlacklistingTextInputFormatter(RegExp("[0-10]")),],
                decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                validator: (val) => val.isEmpty? 'Enter your Last Name' : null ,
                onChanged: (val){
                  setState(() {
                    lastName=val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) {
                  if (val.isEmpty || !val.contains('@')) {
                        return 'Enter valid email';
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
                keyboardType: TextInputType.phone,
                decoration: textInputDecoration.copyWith(hintText: 'Phone Number'),
                validator: (val) {
                     if (val.isEmpty || val.length != 11) {
                      return 'Enter a valid number';
                           }
                      return null;
                                },

                onChanged: (val){
                  setState(() {
                    phoneNumber=val;
                  });
                },
              ),
              
              
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter an password more than 6 chars' : null ,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Confirm Password'),
                validator: (val) => val.length < 6 ?
                 'Enter an password more than 6 chars' :
                 password!=confirmedPassword ?
                 'Password not matched': null ,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    confirmedPassword=val;
                  });
                },
              ),
            SizedBox(height:20.0),
                  FlatButton(
                    onPressed: null,
                    child: Row(
                      children:<Widget>[
                         ClipOval(
                            child: Material(
                            color: Color.fromRGBO(23, 19, 17, 10), // button color
                                child: InkWell(
                                  splashColor:Color.fromRGBO(240, 140, 44, 10), // inkwell color
                                  child: SizedBox(width: 40, height: 40, child: Icon(Icons.add,color: Colors.white,)),
                                  onTap: () {
          Alert(
          context: context,
          title: 'ALert',
          style: AlertStyle(
            titleStyle:TextStyle(fontSize: 0),
            animationType: AnimationType.fromTop,
            animationDuration: Duration(milliseconds: 400),
          ),
          content: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                            FlatButton(
                    onPressed: null,
                    child: Row(
                      children:<Widget>[
                         ClipOval(
                            child: Material(
                            color: Color.fromRGBO(23, 19, 17, 10), // button color
                                child: InkWell(
                                  splashColor:Color.fromRGBO(240, 140, 44, 10), // inkwell color
                                  child: SizedBox(width: 40, height: 40, child: Icon(Icons.add,color: Colors.white,)),
                                  onTap: () async {
                                   image = await UploadImage() .OpenGallery();
                                             }
                                         ),
                                            ),
                                 ),
                                 SizedBox(width:15),
                                 Text('Gallery',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Color.fromRGBO(23, 19, 17, 10))), 
  
                                   ]
                              ) ,
                     ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                 Row(
                    children: <Widget>[
                            FlatButton(
                    onPressed: null,
                    child: Row(
                      children:<Widget>[
                         ClipOval(
                            child: Material(
                            color: Color.fromRGBO(23, 19, 17, 10), // button color
                                child: InkWell(
                                  splashColor:Color.fromRGBO(240, 140, 44, 10), // inkwell color
                                  child: SizedBox(width: 40, height: 40, child: Icon(Icons.camera,color: Colors.white,)),
                                  onTap: () {
                              UploadImage().OpenCamera();
                                img.hello();
                                image=img.getter();
                             
                              
                                             }
                                         ),
                                            ),
                                 ),
                                 SizedBox(width:15),
                                 Text('Camera',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Color.fromRGBO(23, 19, 17, 10))), 
  
                                   ]
                              ) ,
                     ),
                    ],
                  ),
              ],
              
              ),
            
            buttons: [
               DialogButton(
                  child: Text(
                          "Ok",
                         style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    onPressed: () {
                      print('imaage on paath $image');
                      _database.uploadPic(image);

                      Navigator.pop(context, true);
                    },
                       color: Color.fromRGBO(23, 19, 17, 10),
                       width: 120,
                        ),
            ] 
              ).show();
              }),
                  ),
              ),
                        SizedBox(width:15),
                        Text('Upload image',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold,color: Color.fromRGBO(23, 19, 17, 10))), 
  
                                   ]
                              ) ,
                     ),              


            SizedBox(height: 20.0,),
            RaisedButton(
              color: Color.fromRGBO(23, 19, 17, 10),
              child: Text('Register',
              style:TextStyle(color:Colors.white),
              ),
              onPressed: () async{
                     
               if(_formkey.currentState.validate()){
                    setState(() => loading=true);
                    dynamic result = await _auth.registerWithMailAndPassword(firstName,lastName,phoneNumber,basename(image.path),email,password);

                    if(result==null){
                      setState(() {
                        error='could not register';
                        loading=false;
                        });
                    }
                   
               }
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