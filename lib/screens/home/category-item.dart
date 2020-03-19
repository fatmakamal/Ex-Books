
import 'package:ex_books/screens/category-books-screen/category-books-screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ex_books/screens/home/splash-screen.dart';

import '../../models/category.dart';

class CategoryTile extends StatelessWidget {
  final Categoreey category;
  CategoryTile({this.category});

  void selectCategory(BuildContext context)
  {
    // Navigator.push(context, MaterialPageRoute(builder: (context)=> SplashScreen(category: category,)));
    Navigator.push(context, MaterialPageRoute(builder: (context)
     =>
      CategoryBooksScreen(theIdOfSelectedCategory: category.id, theTitleOfSelectedCategory: category.title,)));
    
  }

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
//      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            category.title,
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'RobotoCondensed'),
          ),
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(240, 140, 44, 10),
        ),
      ),
    );
  }
}

//------------------------------old category item ----------------------------


// import 'package:ex_books/screens/category-books-screen.dart';
// import 'package:flutter/material.dart';

// class CategoryItem extends StatelessWidget {
//   final String id;

//   final String title;

//   CategoryItem(this.id, this.title);

//   void selectCategory(BuildContext ctx) {
//     // Navigator.of(ctx).pushNamed(CategoryBooksScreen.routeName, arguments: {
//     //   'id': id,
//     //   'title': title,
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => selectCategory(context),
//       splashColor: Theme.of(context).primaryColor,
// //      borderRadius: BorderRadius.circular(15),
//       child: Container(
//         padding: EdgeInsets.all(15),
//         child: Center(
//           child: Text(
//             title,
//             style: TextStyle(
//                 color: Colors.white70,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 fontFamily: 'RobotoCondensed'),
//           ),
//         ),
//         decoration: BoxDecoration(
//           color: Colors.amber,
//         ),
//       ),
//     );
//   }
// }

