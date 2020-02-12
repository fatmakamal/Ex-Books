import 'package:firebase_auth/firebase_auth.dart';
import 'package:ex_books/models/user.dart';
import 'package:ex_books/services/database.dart';

class Authservices{

final FirebaseAuth _auth = FirebaseAuth.instance;
 
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

Future registerWithMailAndPassword(String email ,String password) async{

  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email,password: password);
    FirebaseUser user = result.user;

    //create a new document for the user with uid
    await DatabaseServices(uid: user.uid).updateUserData('0', 'new crew member', 100);

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



}