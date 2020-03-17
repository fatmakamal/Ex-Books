import 'package:flutter/material.dart';

class Categoreey {
  String id;
  String title;
  Color color;

  Categoreey({
    this.id,
    this.title,
    this.color = Colors.orange,
  });

  Categoreey.fromSnapshot(Map snapshot, String id)
      : id = id,
        title = snapshot['title'];

  toJson() {
    return {
      "title": title,
    };
  }
}
