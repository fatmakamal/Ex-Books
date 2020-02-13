import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ex_books/models/userDetails.dart';

class DatabaseServices {
 
 final String uid;
 DatabaseServices({this.uid});

  //  collection refrence
  final CollectionReference userCOllection = Firestore.instance.collection('users');

Future updateUserData(String firstname, String lastname, String phonenumber,String email)async{
  return await userCOllection.document(uid).setData({
    'firstname': firstname,
    'lastname': lastname,
    'phonenumber':phonenumber,
    'email':email,
      }) ;
}



}