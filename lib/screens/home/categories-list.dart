
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/category.dart';
import 'category-item.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<List<Categoreey>>(context);

    // categories.forEach((Categoreey){
    //   // print("this is Id ${Categoreey.id} , this is title ${Categoreey.title}");
    // });
return GridView.builder(
  
  padding: EdgeInsets.all(25),
  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: categories.length,


 itemBuilder: (context,index){
        return CategoryTile(category: categories[index],);

    }
 );



  }
}