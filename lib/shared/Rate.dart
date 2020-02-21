import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
 
  double rating=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
     child: SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (v) {
            rating = v;
            setState(() {});
          },
          starCount: 5,
          rating: rating,
          size: 20,
          filledIconData: Icons.star,
          halfFilledIconData: Icons.blur_on,
          color: Colors.orange,
          borderColor: Colors.orange,
          spacing:0.0
        )
      
    );
  }
}