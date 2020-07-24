import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/category.dart';
import '../../services/Auth.dart';
import '../../services/database.dart';
import '../../shared/main-drawer.dart';
import '../user_profile.dart';
import 'categories-list.dart';



class Home extends StatelessWidget {

  @override
  final Authservices _auth =Authservices();
  Widget build(BuildContext context) {
    return StreamProvider<List<Categoreey>>.value(
      value: DatabaseServices().categories,
          child: Scaffold(
            appBar:AppBar(
          backgroundColor:  Color.fromRGBO(240, 140, 44, 10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Center(
                child: Container(
                    padding: const EdgeInsets.all(80.0), child: Text('EX Books',style: TextStyle(fontSize:25),)),
              ),
              ],
          ),
          elevation: 0.0,
        ) ,

        drawer: MainDrawer(),


      body:CategoriesList(),
      ),
    );
  }
}




// import 'package:ex_books/services/Auth.dart';
// import 'package:ex_books/shared/category-item.dart';
// import 'package:ex_books/shared/dummy-data.dart';
// import 'package:ex_books/shared/main-drawer.dart';
// import 'package:flutter/material.dart';

// import '../user_profile.dart';

// class Home extends StatelessWidget {
//   @override

//   final Authservices _auth =Authservices();
  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//           backgroundColor:  Color.fromRGBO(240, 140, 44, 10),
//             title: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//               Container(
//                   padding: const EdgeInsets.all(8.0), child: Text('EX Books',style: TextStyle(fontSize:25),)),
             
//               Container(
//                 margin: EdgeInsets.only(left: 90),
//                  padding: EdgeInsets.all(5),
//                  width: 58,
//                  child: InkWell(
//                     onTap: (){
//                       Navigator.push(context,  MaterialPageRoute(builder: (context) => Profile()));
//                     },
//                     child: CircleAvatar(
//                     radius: 20,
//                     backgroundImage: AssetImage('img/profile.jpg',),
//                     backgroundColor: Colors.black38,
//                      ),
//                  ),
//               ),
//               IconButton(
//             icon: Icon(Icons.notifications,size: 28,),
//             onPressed: ()=> null,
//           )
//               ],

//           ),

//           elevation: 0.0,
        
//         ) ,
        




//       drawer: MainDrawer(),
//       body: GridView(
//           padding: EdgeInsets.all(25),

//           children: DUMMY_CATEGORIES.map(
//             // the function that would be created on each data
//                   (catData) {
//                 return CategoryItem(catData.id,catData.title,);
//               }).toList(),
//           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200,
//             childAspectRatio: 3 / 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20,
//           )),
//     );
//   }
// }




