import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ex_books/models/Book.dart';

class Repository {
  final Firestore _db = Firestore.instance;

  final String path;

  CollectionReference ref;

  Repository(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  // Stream<QuerySnapshot> streamDataCollection() {
  //   return ref.snapshots() ;
  // }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }

  Future<void> removeDocument(String id) {
    return ref.document(id).delete();
  }

  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return ref.document(id).updateData(data);
  }

  /*Stream<List<Book>> getByQuery(uid){
    return  ref
        .where('uid', isEqualTo: uid)
        .getDocuments().asStream().map((Q)=>Q.documents).map((doc) => 
                   doc.map((doc)=>
                   new  Book(
                      bookName: doc.data['bookname'],
                      authorName: doc.data['authorname'],
                      bookImage: doc.data['image'],
                      describtion: doc.data['decription'],
                      selectedCategory: doc.data['category'],
                      uid: doc.data['uid'],
                    )
                  )
                   
                  );
           
  }*/
}
