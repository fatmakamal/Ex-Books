import 'package:ex_books/screens/AddBookForm.dart';
import 'package:ex_books/shared/Rate.dart';
import 'package:flutter/material.dart';
import 'package:ex_books/shared/loading.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
 
   bool loading =false; 
  @override


  Widget build(BuildContext context) {

    return loading ? Loading():Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Color.fromRGBO(240, 140, 44, 10),
         title: Row(
             
              children: [

              Container(
                  padding:  EdgeInsets.all(80.0), child: Text('EX Books',style: TextStyle(fontSize:25),))
            ],

          ),
        elevation: 0.0,

      ) ,

      body: Column(
        children: <Widget>[
          SizedBox(height: 16,),
          Padding(
            padding:  EdgeInsets.fromLTRB(150,5, 150, 25),
            child: Column(
              children:<Widget>[
                 CircleAvatar(
                   radius: 70,
                   backgroundImage: AssetImage('img/profile.jpg',),
                 ),
                 SizedBox(height:16.0),
                 Container(
                  // width: 200.0,
                   child: FittedBox(
                     fit: BoxFit.contain,
                     child:Text('Toqa EL Lithy',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black)),)),
                  SizedBox(height: 5,),
                  Rate(),   
              ]
            ),
          ),

          Container(
            height: 6.0,
            decoration: BoxDecoration(
              gradient:LinearGradient(
                begin:Alignment.topLeft,
                end:Alignment.bottomRight,
                colors:[Color.fromRGBO(23, 19, 17, 10),Color.fromRGBO(240, 140, 44, 10)],
              )
            ),
          ),
          
          SizedBox(
            height: 20,
          ),

      Flexible(
        child: ListView.builder(
          
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,int index)=>EachBook(),
          itemCount: 6,
        ),
      ),


Container(
 padding: EdgeInsets.fromLTRB(10, 0, 0,55),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.start,
  
    children: <Widget>[
  
          SizedBox(width: 30,),
  
          ClipOval(
  
      
  
        child: Material(
  
      
  
          color: Color.fromRGBO(23, 19, 17, 10), // button color
  
      
  
          child: InkWell(
  
      
  
            splashColor:Color.fromRGBO(240, 140, 44, 10), // inkwell color
  
      
  
            child: SizedBox(width: 56, height: 56, child: Icon(Icons.add,color: Colors.white,)),
  
      
  
            onTap: () {
              Navigator.push(context,  MaterialPageRoute(builder: (context) => AddBookForm()));
            }
  
      
  
          ),
  
      
  
        ),
  
      
  
      ),
  
     SizedBox(width:15),
  
     
  
     Text('Add New Book',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Color.fromRGBO(240, 140, 44, 10))), 
  
    ],
  
  ),
)

        
        
        
        
        ],
      ),
      );


    }
}

class EachBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0,0, 0),
      child: InkWell(
        onTap: () {
          showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0)),
                content: Container(
                  height: 250,
                    child: Column(
                    
                    mainAxisAlignment:MainAxisAlignment.start,
                    children:<Widget>[
                      
                       
                           Text('Book Name ',style: TextStyle(fontSize:24,fontWeight: FontWeight.bold,color: Colors.red),),
                           SizedBox(height:5),
                           Text("The blue Elephant",style: TextStyle(fontSize:18),),
                           SizedBox(height: 10,),
                     

                            Text('Book Description ',style: TextStyle(fontSize:24,fontWeight:FontWeight.bold,color: Colors.red),),
                            SizedBox(height:5),
                            Container(
                              width: 230,
                              child: Text("Clean copy . Book in Arabic Best Selling book 19 sold last 3 months. Get your copy before it is sold out. ",style: TextStyle(fontSize:16),)),
                             
                        
                       
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context, 
        pageBuilder: (context, animation1, animation2) {
          return null;
        });
           },

        child: Container(
          width: 180.0,
          height: 180.0,
          child: ListTile(
            title: Image.asset(
              'img/book1.jpg',
              width:180.0,
              height:180.0,
            ),

          ),
        ),
      ),
      
    );
  }
}

