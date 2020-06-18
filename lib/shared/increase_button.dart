import 'package:flutter/material.dart';

class QuantityButton extends StatefulWidget {
  @override
  int max;
  int current;

  int getCurrent(){
    return current;
  }

  QuantityButton({this.max, this.current});
  _QuantityButtonState createState() => _QuantityButtonState();
}

class _QuantityButtonState extends State<QuantityButton> {
  int _n = 0;

  void add() {
    setState(() {
      if (_n < widget.max) _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0) _n--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 150,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          new FloatingActionButton(
            heroTag: "bt1",
            onPressed: () {
              add();
              setState(() {
                widget.current = _n;
              });
              print(widget.current);
            },
            child: new Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
          new Text('$_n',
              style: new TextStyle(fontSize: 20.0, color: Colors.red)),
          new FloatingActionButton(
            onPressed: () {
              minus();

              setState(() {
                widget.current = _n;
              });
            },
            heroTag: "bt2",
            child: new Icon(const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                color: Colors.black),
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
