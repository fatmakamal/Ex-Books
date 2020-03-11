import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ex_books/common/Repository.dart';
import 'package:ex_books/models/Book.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import '../models/category.dart';

class DatabaseServices {
  final String uid;
  final Repository _bookRepo = new Repository("books");
  DatabaseServices({this.uid});

  //---------------------
   //collection refrence w hwa refrence l collection mo3in fi ll database
  final CollectionReference categoriesCollection = Firestore.instance.collection('categories');

  //----------------collection refrence------------------------------------
  final CollectionReference userCOllection =
      Firestore.instance.collection('users');
  final CollectionReference bookCOllection =
      Firestore.instance.collection('books');

//---------------------Add new User----------------------------------------
  Future updateUserData(String firstname, String lastname, String phonenumber,
      var image, String email, String uid) async {
    return await userCOllection.document(uid).setData({
      'firstname': firstname,
      'lastname': lastname,
      'phonenumber': phonenumber,
      'image': image,
      'email': email,
      'uid': uid,
    });
  }

//--------------------------Add new Book-------------------------------------------
  Future updateBookData(String uid, String bookname, String authorname,
      var image, String category, String description) async {
    return await bookCOllection.document().setData({
      'uid': uid,
      'bookname': bookname,
      'authorname': authorname,
      'image': image,
      'category': category,
      'decription': description,
    });
  }

//------------save image on fire storage------------------
  Future uploadPic(File _image) async {
    print('image path is $_image');
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    print("image uploaded on path $_image");
  }

// get books stream
  Stream<List<Book>> get books {
    return bookCOllection.snapshots().map(bookListFromSnapshot);
  }
  
//book list from snapshot

  List<Book> bookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Book(
        bookName: doc.data['bookname'] ?? '',
        authorName: doc.data['authorname'] ?? '',
        bookImage: doc.data['image'] ?? '',
        describtion: doc.data['decription'] ?? '',
        selectedCategory: doc.data['category'] ?? '',
        uid: doc.data['uid'],
      );
    }).toList();
  }

  Future deleteBook(docId) async{
    // bookCOllection.document(docId).delete();
      await _bookRepo.removeDocument(docId);
      return;
  }

  Future<List<Book>> getBooks(uId) async {
    List<Book> books;
    var result = _bookRepo.getDataCollection();
    if (uId != 0) {
      books = await result.then((doc) {
        return doc.documents
            .map((b) => Book.fromSnapshot(b.data, b.documentID))
            .where((book) => book.uid == uId)
            .toList();
      });
    } else {
      books = await result.then((doc) {
        return doc.documents
            .map((b) => Book.fromSnapshot(b.data, b.documentID))
            .toList();
      });
    }
    return books;
  }


  //-------------------------------------------------------------------------------------

  //category list from snapshot function
List<Categoreey> _categoryListFromSnapshot(QuerySnapshot snapshot)
{
  return snapshot.documents.map((doc){
    return Categoreey(
      id: doc.documentID,
      title: doc.data['title'] ?? '',
      );
  }).toList();
}
//get categories stream 

Stream<List<Categoreey>> get categories
{
  return categoriesCollection.snapshots()
  .map(_categoryListFromSnapshot);
}

  // getUserData(String userId)
  // {
  //   // var username ;

  //   //     final docRef =  Firestore.instance.collection('users').document(userId).get()
  //   //     .then((val){
  //   //       username = val.data['firstname'];
  //   //       print("this issssssssssssssssssss $username");
  //   //       // return val.data['firstname']; 
  //   //     });

  //   //     return username;

  //       return Firestore.instance.collection('users')
  //       .where('uid', isEqualTo: userId).getDocuments();

  // }

  // getUserData(String UserId)
  // {
  //   return Firestore.instance.collection('users').document(UserId).get({
  //     'firstname' 
  //   });
  // }


}
