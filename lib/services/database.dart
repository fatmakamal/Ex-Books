import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ex_books/common/Repository.dart';
import 'package:ex_books/models/Book.dart';
import 'package:ex_books/models/Cart.dart';
import 'package:ex_books/models/Online_books.dart';
import 'package:ex_books/models/userDetails.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import '../models/category.dart';
import '../models/user.dart';

class DatabaseServices {
  final String uid;
  final Repository _categoryRepo = new Repository("categories");
  final Repository _bookRepo = new Repository("books");
  final Repository _userRepo = new Repository("users");
  final Repository _cartRepo = new Repository("cart");
  final cartDB = Firestore.instance.collection("cart");

  DatabaseServices({this.uid});

  //---------------------

  //----------------collection refrence------------------------------------
  final CollectionReference categoriesCollection =
      Firestore.instance.collection('categories');
  final CollectionReference userCOllection =
      Firestore.instance.collection('users');
  final CollectionReference bookCOllection =
      Firestore.instance.collection('books');
  final CollectionReference onlineBookCOllection =
      Firestore.instance.collection('Online_books');
  final CollectionReference cartCOllection =
      Firestore.instance.collection('cart');
  final CollectionReference orderCOllection =
      Firestore.instance.collection('order');

//-------------------------------------------------------------------------------
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
  Future updateBookData(
      String uid,
      String bookname,
      String authorname,
      var image,
      String category,
      String description,
      String username,
      String userImage) async {
    return await bookCOllection.document().setData({
      'uid': uid,
      'bookname': bookname,
      'authorname': authorname,
      'image': image,
      'category': category,
      'decription': description,
      'username': username,
      'userimage': userImage,
    });
  }

//--------------------------Add new Online bookBook-------------------------------------------
  Future updateOnlineBookData(
    String bookname,
    String authorname,
    var image,
    String category,
    String description,
    int price,
    int quantity,
  ) async {
    return await onlineBookCOllection.document().setData({
      'bookname': bookname,
      'authorname': authorname,
      'image': image,
      'category': category,
      'decription': description,
      'price': price,
      'quantity': quantity,
    });
  }

//--------------------------Add new Online bookBook-------------------------------------------
  Future addToCart(
    String bookname,
    var image,
    var price,
    int quantity,
    String uid,
  ) async {
    return await cartCOllection.document().setData({
      'bookname': bookname,
      'image': image,
      'price': price,
      'quantity': quantity,
      'uid': uid,
    });
  }

  //--------------------------Add new order -------------------------------------------
  Future addNewOrder(
    String address,
    String phone,
    int totalPay,
    String uid,
  ) async {
    return await orderCOllection.document().setData({
      'address': address,
      'phone': phone,
      'totalPay': totalPay,
      'uid': uid,
    });
  }

//---------------------------------------------------------------

//---------------------------------------------------------------
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

//---------------------------------------------------------------------------

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

  // get Online books stream
  Stream<List<OnlineBook>> get onlineBooks {
    return onlineBookCOllection.snapshots().map(onlinebookListFromSnapshot);
  }

  Future<List<OnlineBook>> getOnlineBook() async {
    var result = await onlineBookCOllection.getDocuments();
    List<OnlineBook> books = result.documents
        .map((e) => OnlineBook.fromSnapshot(e.data, e.documentID))
        .toList();
    return books;
  }


//online book list from snapshot

  List<OnlineBook> onlinebookListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return OnlineBook(
        bookName: doc.data['bookname'] ?? '',
        authorName: doc.data['authorname'] ?? '',
        bookImage: doc.data['image'] ?? '',
        describtion: doc.data['decription'] ?? '',
        category: doc.data['category'] ?? '',
        price: doc.data['price'],
        quantity: doc.data['quantity'],
      );
    }).toList();
  }

  // get cart items stream
  Stream<List<Cart>> get cart {
    return cartCOllection.snapshots().map(cartItemListFromSnapshot);
  }

//online cart items list list from snapshot

  List<Cart> cartItemListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Cart(
        documentId: doc.documentID,
        uid: doc.data['uid'],
        bookName: doc.data['bookname'] ?? '',
        bookImage: doc.data['image'] ?? '',
        price: doc.data['price'],
        quantity: doc.data['quantity'],
      );
    }).toList();
  }

  Future<List<Cart>> getByUserId(userId) async {
    var result = await cartDB.where("uid", isEqualTo: userId).getDocuments();
    List<Cart> carts = result.documents
        .map((b) => Cart.fromSnapshot(b.data, b.documentID))
        .toList();
    return carts;
  }

//---------------------------------------------------------------------------------

//----------Delete book function---------------

  Future deleteBook(docId) async {
    // bookCOllection.document(docId).delete();
    await _bookRepo.removeDocument(docId);
    return;
  }

  //----------Delete item from cart function---------------

  Future deleteitem(docId) async {
    // bookCOllection.document(docId).delete();
    await _cartRepo.removeDocument(docId);
    return;
  }

//--------------get specific user's books------------

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

  //------------------------------------------------------------------

  Future getUser(String uid) async {
    try {
      var userData = await userCOllection.document(uid).get();
      return UserDetails.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }

  //-----------------------Get category List---------------------------------

  Future<List<Categoreey>> getCategories() async {
    return _categoryRepo.getDataCollection().then((doc) {
      return doc.documents
          .map((b) => Categoreey.fromSnapshot(b.data, b.documentID))
          .toList();
    });
  }

  //-----------------------Get users List-----------------------------------------

  Future<List<User>> getUsers() async {
    return _userRepo.getDataCollection().then((doc) {
      return doc.documents.map((b) => User.fromSnapshot(b.data)).toList();
    });
  }

//----------------------------------------------------------------------------

  //------------category list from snapshot function-----------------------
  List<Categoreey> _categoryListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Categoreey(
        id: doc.documentID,
        title: doc.data['title'] ?? '',
      );
    }).toList();
  }
//-----------get categories stream--------------------------------

  Stream<List<Categoreey>> get categories {
    return categoriesCollection.snapshots().map(_categoryListFromSnapshot);
  }

//------------------------------------------------------------------
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
  // ----------get user details-------------

  // List<UserDetails> userDetailsFromSnapshot(DocumentSnapshot snapshot) {
  //   return snapshot.((doc) {
  //     return UserDetails(
  //       firstName: doc.data['firstname'],
  //       lastName: doc.data['lastname'],
  //       image: doc.data['image'],
  //       email: doc.data['email'],
  //       phoneNumber: doc.data['phonenumber'],
  //       userID: doc.data['uid'],
  //     ) ;
  //   }).toList();
  // }

}
