// import 'package:ex_books/shared/book-item.dart';
// import 'package:ex_books/shared/dummy-data.dart';
// import 'package:ex_books/shared/main-drawer.dart';
// import 'package:flutter/material.dart';


// class CategoryBooksScreen extends StatelessWidget {
//   static const routeName = '/category-books';

//   @override
//   Widget build(BuildContext context) {
//     final routeArgs =
//         ModalRoute.of(context).settings.arguments as Map<String, String>;
//     final categoryId = routeArgs['id'];
//     final categoryTitle = routeArgs['title'];

//     final categoryBooks = DUMMY_BOOKS.where((book) {
//       return book.categories.contains(categoryId);
//     }).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//         backgroundColor: Color.fromRGBO(240, 140, 44, 10),
//       ),
//       drawer: MainDrawer(),
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return BookItem(
//             id: categoryBooks[index].id,
//             title: categoryBooks[index].title,
//             imageUrl: categoryBooks[index].imageUrl,
//             userName: categoryBooks[index].userName,
//             userImageUrl: categoryBooks[index].userImageUrl,

//           );
//         },
//         itemCount: categoryBooks.length,
//       ),
//     );
//   }
// }
