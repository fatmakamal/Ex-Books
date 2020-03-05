import 'package:flutter/foundation.dart';

class Book {
  final String id;
  final List<String> categories;
  final String title;
  final String authorName;
  final String imageUrl;
  final double price;
  final String describtion;

  final String userName;
  final String userImageUrl;

  const Book(
      {@required this.id,
        @required this.categories,
        @required this.title,
        @required this.authorName,
        @required this.price,
        @required this.imageUrl,
        @required this.describtion,
        @required this.userName,
        @required this.userImageUrl,
        });
}
