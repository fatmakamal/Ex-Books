// import 'package:ex_books/models/Book.dart';
// import 'package:ex_books/models/category.dart';
// import 'package:ex_books/services/database.dart';
// import 'package:flutter/material.dart';

// import 'owner-each-book.dart';

// class OwnerBooksList extends StatefulWidget {
//   final String userId;
//   OwnerBooksList({this.userId});

//   @override
//   _OwnerBooksListState createState() => _OwnerBooksListState();
// }

// class _OwnerBooksListState extends State<OwnerBooksList> {
//   DatabaseServices service = new DatabaseServices();
//   List<Book> userBooks = new List<Book>();
//   List<Categoreey> categories = new List<Categoreey>();

//   fillBookData() async {
//     // FirebaseUser cUser = await FirebaseAuth.instance.currentUser();
//     List<Book> user = await service.getBooks(widget.userId);
//     List<Categoreey> cat = await service.getCategories();
//     setState(() {
//       userBooks = user;
//       categories = cat;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     fillBookData();

//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) =>
//           OwnerEachBook(book: userBooks[index], categories: categories),
//       itemCount: userBooks.length,
//     );
//   }
// }

// // import 'package:ex_books/models/Book.dart';
// // import 'package:ex_books/screens/category-books-screen/owner-booksList2.dart';
// // import 'package:ex_books/services/database.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // class OwnerBooksList extends StatefulWidget {
// //   final String userFullName;
// //   final String userImg ;
// //   final String userId;

// //   OwnerBooksList({this.userFullName,this.userImg,this.userId});
// //   @override
// //   _OwnerBooksListState createState() => _OwnerBooksListState();
// // }

// // class _OwnerBooksListState extends State<OwnerBooksList> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return StreamProvider<List<Book>>.value(
// //       value : DatabaseServices().books,

// //           child: OwnerbooksList2(userFullName: widget.userFullName, userImg: widget.userImg, userId: widget.userId,),
// //     );
// //   }
// // }
