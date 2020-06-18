import 'package:ex_books/shared/Rate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/models/userDetails.dart';
import 'dart:io';

class Authservices{

final FirebaseAuth _auth = FirebaseAuth.instance;

//---------------------------------------------------

Rate rate = Rate();

Future getCurrentUser()async{
FirebaseUser user = await _auth.currentUser();
return user;
//print("the user id is $uid");
}

//--------get a user from firebase user----

User _userFromFirebaseUser(FirebaseUser user)
{
  if(user!=null)
   return User(uid: user.uid);
   else
    return null;
}


//---- auth change user stream---------------

Stream<User> get user {
  return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
}

//--------Sign Out----------------------------

Future SignOut() async{
  try{
    return await _auth.signOut();

  }catch(e){
    print(e.toString());
    return null;
  }

}

//---------- Register using email and password----------

Future registerWithMailAndPassword(String firstname,String lastname,String phonenumber,var image,String email ,String password) async{

  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password: password);
    FirebaseUser user = result.user;

    //create a new document for the user with uid
    await DatabaseServices(uid: user.uid).updateUserData(firstname, lastname , phonenumber ,image, email,user.uid);

    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  }

//---------- SignIn using email and password----------

Future signInWithMailAndPassword(String email ,String password) async{

  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }  

}

//-------Reset Password------------
Future sendPasswordResetEmail(String email) async{
return _auth.sendPasswordResetEmail(email: email);
}



//-----------Add new book---------------
Future addNewBook(String bookname,String authorname,var image,String category ,String description,String username,String userImage) async{

  try{
    final FirebaseUser user = await _auth.currentUser();
    
    //create a new document for the user with uid
    await DatabaseServices(uid: user.uid).updateBookData(user.uid,bookname, authorname , image , category ,description,username,userImage);

    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  }

//-----------Add new online book---------------
Future addNewOnlineBook(String bookname,String authorname,var image,String category ,String description,var price,int quantity) async{

  try{
    final FirebaseUser user = await _auth.currentUser();
    
    
    await DatabaseServices(uid: user.uid).updateOnlineBookData(bookname, authorname , image , category ,description,price,quantity);

    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  }  

//-----------Add to cart---------------
Future addToCart(String bookname,var image ,var price,int quantity) async{

  try{
    final FirebaseUser user = await _auth.currentUser();
    
    await DatabaseServices(uid: user.uid).addToCart(bookname , image ,price,quantity,user.uid);

    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  } 

  //-----------Add order---------------
Future addOrder(String address,String phone ,int totalPay) async{

  try{
    final FirebaseUser user = await _auth.currentUser();
    
    await DatabaseServices(uid: user.uid).addNewOrder(address , phone , totalPay, user.uid);

    return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;
  }
  } 


  
}