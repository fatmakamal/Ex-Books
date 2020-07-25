import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child:Center(
        child: SpinKitChasingDots(color: Color.fromRGBO(240, 140, 44, 10),size: 50.0,)
      )
    );
  }
}