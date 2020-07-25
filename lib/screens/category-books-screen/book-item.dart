import 'package:ex_books/models/Book.dart';
import 'package:ex_books/screens/category-books-screen/book-details-screen.dart';
import 'package:ex_books/services/upload_iamge.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

class BookItem extends StatefulWidget {
  @override
  _BookItemState createState() => _BookItemState();
  final Book book;
  final List<User> users;

  BookItem({this.book, this.users});
}

class _BookItemState extends State<BookItem> {
  UploadImage _imageService = new UploadImage();
  String bookImage = "";
  String userrrImage = "";

  @override
  void initState() {
    super.initState();
    uploadImages();
  }

  uploadImages() async {
    await getBookImage();
    await getUserImage();
  }

  getBookImage() async {
    _imageService.getDownloadURI(widget.book.bookImage).then((val) => {
          setState(() {
            bookImage = val;
          })
        });
  }

  getUserImage() async {
    if (widget.users.length == 0) return;
    _imageService
        .getDownloadURI(widget.users
            .firstWhere((user) => user.uid == widget.book.uid)
            .image)
        .then((res) => {
              setState(() {
                userrrImage = res;
              })
            });
  }

  // var username;

  // void selectBook(ctx, String userFullName, String defaultImg, String userPhone,
  //     String userId) {
  //   Navigator.push(
  //       ctx,
  //       MaterialPageRoute(
  //           builder: (ctx) => BookDetailsScreen(
  //               book: widget.book,
  //               userFullName: userFullName,
  //               userImg: defaultImg,
  //               userphone: userPhone,
  //               userId: userId)));
  //   // var username = DatabaseServices().getUserData(book.uid);
  // }

  @override
  Widget build(BuildContext context) {
    final userFirstName = widget.users
        .firstWhere((user) => user.uid == widget.book.uid)
        .firstname;
    final userLastName =
        widget.users.firstWhere((user) => user.uid == widget.book.uid).lastname;
    final userFullName = "$userFirstName $userLastName";
    final userImage =
        widget.users.firstWhere((user) => user.uid == widget.book.uid).image;
    final userPhone = widget.users
        .firstWhere((user) => user.uid == widget.book.uid)
        .phonenumber;
    final userId =
        widget.users.firstWhere((user) => user.uid == widget.book.uid).uid;
        final user = widget.users.firstWhere((user) => user.uid == widget.book.uid);

    // String path = '/data/user/0/com.example.ex_books/cache/';
    // String total = "";

    // String totalImagePath = path + userImage;
    String defultImage = "img/defult.jpg";

    // String getImage() {
    //   return total == "" ? defultImage : total;
    // }

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailsScreen(user: user,book: widget.book,)));
      },
          // selectBook(context, userFullName, bookImage, userPhone, userId),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.black38,
                    child: bookImage == ''
                        ? Image.network(
                            'https://hpmedia.bloomsbury.com/rep/s/9781408855959_309031.jpeg',
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.network(bookImage,
                            height: 250,
                            width: double.infinity,
                            fit: BoxFit.cover),
                  ),
                ),
                //-------------user name and pic positioned--------------
                Positioned(
                  top: 20,
                  left: 10,
                  child: Container(
                    height: 60,
                    color: Colors.black54,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 15),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            backgroundImage: userrrImage == ''
                                ? AssetImage(
                                    // 'img/selena.jpg'
                                    defultImage,
                                  )
                                : NetworkImage(userrrImage),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            userFullName,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  //-------------------
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    color: Colors.black54,
                    child: Text(
                      widget.book.bookName,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//-------------------------old book item -------------------------

// import 'package:ex_books/screens/book-details-screen.dart';
// import 'package:flutter/material.dart';

// class BookItem extends StatelessWidget {
//   final String id;

//   final String title;
//   final String imageUrl;
//   final String userName;
//   final String userImageUrl;

//   BookItem({
//     @required this.id,
//     @required this.title,
//     @required this.imageUrl,
//     @required this.userName,
//     @required this.userImageUrl,
//   });

//   void selectBook(ctx) {
//     Navigator.of(ctx).pushNamed(BookDetailsScreen.routeName, arguments: id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => selectBook(context),
//       child: Card(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         elevation: 4,
//         margin: EdgeInsets.all(10),
//         child: Column(
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15)),
//                   child: Container(
//                     height: 300,
//                     width: double.infinity,
//                     color: Colors.black38,
//                     child: Image.network(
//                       imageUrl,
//                       height: 250,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 //-------------user name and pic positioned--------------
//                 Positioned(
//                   top: 20,
//                   left: 10,
//                   child: Container(
//                     height: 60,
//                     color: Colors.black54,
//                     child: Row(
//                       children: <Widget>[
//                         Container(

//                           margin: EdgeInsets.only(left: 10, right: 15),
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(50),
//                             color: Colors.white,
//                           ),
//                           child: Icon(Icons.person,size: 50,)
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Text(
//                             userName,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   //-------------------
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   right: 10,
//                   child: Container(
//                     width: 220,
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                     color: Colors.black54,
//                     child: Text(
//                       title,
//                       style: TextStyle(fontSize: 26, color: Colors.white),
//                       softWrap: true,
//                       overflow: TextOverflow.fade,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
