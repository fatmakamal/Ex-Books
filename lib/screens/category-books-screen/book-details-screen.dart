import 'package:ex_books/models/Book.dart';
import 'package:ex_books/shared/dummy-data.dart';
import 'package:ex_books/shared/main-drawer.dart';
import 'package:flutter/material.dart';


class BookDetailsScreen extends StatelessWidget {

  final Book book;
  final String userFullName;
  final String userImg ;

    BookDetailsScreen({this.book,this.userFullName,this.userImg});

  @override
  Widget build(BuildContext context) {

    



    // final selectedBook = DUMMY_BOOKS.firstWhere((book) {
    //   return book.id == bookId;
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text(book.bookName),
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 15),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child:
                         CircleAvatar(
                            backgroundImage: AssetImage(
                              // 'img/selena.jpg'
                              '$userImg' ,
                              ),
                              ),
//                        Image.network(
//                          selectedBook.userImageUrl,
//                          fit: BoxFit.cover,
//                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          userFullName,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.amber,
                  child: Container(
                    child: Image.network(
                      'https://hpmedia.bloomsbury.com/rep/s/9781408855959_309031.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              'Author Name :',
                              style:
                                  TextStyle(color: Theme.of(context).accentColor, fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '${book.authorName}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            //----------------describtion title container --------
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Describtion',
                style: Theme.of(context).textTheme.title,
              ),
            ),

            //----------describtion container ----------
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: Container(
//                decoration: BoxDecoration(
//
//                    color: Colors.black12,
//                    border: Border.all(color: Colors.black),
//                    borderRadius: BorderRadius.circular(15)),
                height: 130,
                width: 330,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: Text(
                  book.describtion,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
            ),
            //-----------------------------------
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //-------------chat raised button----------
                  RaisedButton.icon(
                    color: Theme.of(context).accentColor,
                      onPressed: () => null,
                      icon: Icon(Icons.chat,color: Colors.white,),
                      label: Text('Chat',style: TextStyle(color: Colors.white,fontSize: 20),)
                  ),
                  //------------------------
                  //--------call raised button------------

                  RaisedButton.icon(
                      color: Theme.of(context).accentColor,
                      onPressed: () => null,
                      icon: Icon(Icons.call,color: Colors.white,),
                      label: Text('Call',style: TextStyle(color: Colors.white,fontSize: 20),)
                  ),
                  //------------------------


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
