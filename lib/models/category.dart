import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Categoreey {
  final String id;
  final String title;
  final Color color;

   Categoreey({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}