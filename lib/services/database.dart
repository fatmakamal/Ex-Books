import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ex_books/models/userDetails.dart';

class DatabaseServices {
 
 final String uid;
 DatabaseServices({this.uid});

  //  collection refrence
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

Future updateUserData(String sugars, String name, int strength)async{
  return await brewCollection.document(uid).setData({
    'sugars': sugars,
    'name': name,
    'strenght':strength,
      }) ;
}



}