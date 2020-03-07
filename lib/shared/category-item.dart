

import 'package:ex_books/screens/category-books-screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;

  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryBooksScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
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
            title,
            style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'RobotoCondensed'),
          ),
        ),
        decoration: BoxDecoration(
          color: color,
//          gradient: LinearGradient(
//              begin: Alignment.centerRight,
//              end: Alignment.bottomRight,
//              colors: [Colors.white70, coloor]),
//          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

