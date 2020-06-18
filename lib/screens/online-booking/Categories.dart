import 'package:flutter/material.dart';

class OnlineCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            catName: 'Action',
          ),
          
          Category(
            catName: 'Horror',
          ),
          
          Category(
            catName: 'science',
          ),
          Category(
            catName: 'Romance',
          ),          
          

                                      
        ],
      )
    );
  }
}

class Category extends StatelessWidget {
  final String catName;

  Category({
  
    this.catName

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: (){},
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
          child: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Text(
              catName,
              style: TextStyle(
                  color: Color.fromRGBO(240, 140, 44, 10),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed'),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
      ),
        ),
      ),
      
    );
  }
}