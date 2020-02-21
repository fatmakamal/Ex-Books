import 'package:flutter/material.dart';
import 'package:ex_books/shared/constants.dart';

class AddBookForm extends StatefulWidget {
  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
 
  final _formkey = GlobalKey<FormState>();
  List<String> categories = ['Action', 'Romance', 'Drama', 'Science','Education'];
   String bookName ='';
   String authorName='';
   String bookImage='';
   String selectedCategory='Select Category';
   String describtion='';
   
  String error='';


 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor:Color.fromRGBO(240, 140, 44, 10),
        title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Image.asset(
                 'img/logo.png',
                  fit: BoxFit.contain,
                  height: 45,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('EX Books',))
            ],

          ),
        elevation: 0.0,

      ) ,

      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50.0),
          child: Form(
            key: _formkey,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
               Center(
                 child: Text("Add New Book",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
               ),
               SizedBox(height:20) ,
               TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Book Name',prefixIcon: Icon(Icons.book)),
                    validator: (val) {
                          if (val.isEmpty) {
                             return 'Enter the Book Name';
                                          }
                             return null;
                                      }, 
                     onChanged: (val){
                       setState(() {
                         bookName=val;
                                   });
                                   },
                    ),
                  SizedBox(height: 20.0,),
                  DropdownButtonFormField(
                      validator: (String val) {
                      if (val?.isEmpty ?? true) {
                        return 'Choose a category';
                      }},
                    hint: Text('$selectedCategory'),
                    items: categories.map((cat){
                      return DropdownMenuItem(
                       value: cat,
                       child: Text('$cat '),
                      );
                    }).toList(), 
                    onChanged: (val) => setState(()=>selectedCategory=val)),
                  SizedBox(height: 20.0,),
                  TextFormField(
                   decoration: textInputDecoration.copyWith(hintText: 'Author Name',prefixIcon: Icon(Icons.person)),
                   validator: (val) {
                        if (val.isEmpty) {
                            return 'Enter the Author Name';
                                         }
                            return null;
                                    }, 
                    onChanged: (val){
                           setState(() {
                               authorName=val;
                                       });
                                                                  },
                                 ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                      decoration: textInputDecoration.copyWith(hintText: 'Book Image',prefixIcon: Icon(Icons.image)),
                      validator: (val) {
                          if (val.isEmpty) {
                              return 'Upload image';
                                           }
                                return null;
                                      }, 
                      onChanged: (val){
                         setState(() {
                            bookImage=val;
                                     });
                                      },
                               ),
                  
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Describtion',prefixIcon: Icon(Icons.text_fields)),
                    validator: (val) {
                      if (val.isEmpty) {
                           return 'Enter the Book Describtion';
                                      }
                           return null;
                                    }, 
                    onChanged: (val){
                        setState(() {
                           describtion=val;
                                   });
                                    },
                              ),

                SizedBox(height: 20.0,),
                
                RaisedButton(
                  color: Color.fromRGBO(23, 19, 17, 10),
                  child: Text('Submit',
                  style:TextStyle(color:Colors.white),
                  ),
                  onPressed: () async{
                     _formkey.currentState.validate();
                     print(bookName);
                     print(authorName);
                     print(describtion);
                     print(selectedCategory);
                  },
                ),
              ],
            ),
          ) ,
        ),
      ),
    );
  }
}