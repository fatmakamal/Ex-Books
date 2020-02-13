import 'package:flutter/material.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/shared/constants.dart';
import 'package:ex_books/shared/loading.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final _formkey = GlobalKey<FormState>();
  final Authservices _auth = Authservices();
  String firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String email='';
  String password='';
  String confirmedPassword = '';
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


            SizedBox(height: 20.0,),
            RaisedButton(
              color: Color.fromRGBO(23, 19, 17, 10),
              child: Text('Register',
              style:TextStyle(color:Colors.white),
              ),
              onPressed: () async{
               if(_formkey.currentState.validate()){
                    setState(() => loading=true);
                    dynamic result = await _auth.registerWithMailAndPassword(firstName,lastName,phoneNumber,email,password);
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