import 'package:ex_books/screens/online-booking/Cart.dart';
import 'package:ex_books/screens/online-booking/Online-home.dart';
import 'package:ex_books/services/Auth.dart';
import 'package:ex_books/services/database.dart';
import 'package:ex_books/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
  final List<String> bookIds;
  final int totalPrice;

  Checkout({this.bookIds, this.totalPrice});
}

class _CheckoutState extends State<Checkout> {
  final _form = GlobalKey<FormState>();
  bool loading = false;
  final Authservices _auth = Authservices();
  String address = '';
  String phone = '';
  int totalPay = 100;
  String error = '';

  Future deleteitem(String docId) async {
    DatabaseServices service = new DatabaseServices();
    await service.deleteitem(docId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'img/logo.png',
              fit: BoxFit.contain,
              height: 45,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'EX Books',
                ))
          ],
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _form,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Center(
                    child: Text("Checkout",
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(240, 140, 44, 10)))),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Adress', prefixIcon: Icon(Icons.home)),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter the Address';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      address = val;
                    });
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Phone number', prefixIcon: Icon(Icons.phone)),
                  validator: (val) {
                    if (val.isEmpty || val.length != 11) {
                      return 'Enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      phone = val;
                    });
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Color.fromRGBO(23, 19, 17, 10),
                          child: SizedBox(
                            width: 10,
                            height: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Total payment : " + widget.totalPrice.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(240, 140, 44, 10))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Color.fromRGBO(23, 19, 17, 10),
                          child: SizedBox(
                            width: 10,
                            height: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Payment is cashed on dilvired",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(240, 140, 44, 10))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Row(
                    children: <Widget>[
                      ClipOval(
                        child: Material(
                          color: Color.fromRGBO(23, 19, 17, 10),
                          child: SizedBox(
                            width: 10,
                            height: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Order will dilvired within 7 days",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(240, 140, 44, 10))),
                    ],
                  ),
                ),
                RaisedButton(
                  color: Color.fromRGBO(23, 19, 17, 10),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  onPressed: () async {
                    if (_form.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.addOrder(
                        address,
                        phone,
                        widget.totalPrice,
                      );
                      for (var item in widget.bookIds) {
                        await this.deleteitem(item);
                      }

                      if (result == null) {
                        setState(() {
                          error = 'could not submit';
                          loading = false;
                        });
                      } else {
                        Alert(
                            context: context,
                            title: 'ALert',
                            style: AlertStyle(
                              titleStyle: TextStyle(fontSize: 0),
                              animationType: AnimationType.fromTop,
                              animationDuration: Duration(milliseconds: 400),
                            ),
                            content: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.warning,
                                  color: Color.fromRGBO(180, 10, 3, 2),
                                  size: 47,
                                ),
                                SizedBox(height: 20.0),
                                Text(
                                  'Order placed Successfuly',
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(height: 9.0),
                              ],
                            ),
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Ok",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pop(context, true);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OnlineHome()));
                                },
                                color: Color.fromRGBO(23, 19, 17, 10),
                                width: 120,
                              ),
                            ]).show();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
