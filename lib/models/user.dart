class User{

final String uid;
final String firstname;
final String lastname;
final String image;



User({this.uid,this.firstname,this.lastname,this.image});

User.fromSnapshot(Map snapshot)
      : 
        uid = snapshot['uid'],
        firstname = snapshot['firstname'],
        lastname = snapshot['lastname'],
        image = snapshot['image'];



  toJson() {
    return {
      "uid": uid,
      "firstname" : firstname,
      "lasname" : lastname,
      "image" : image,
    };
  }


}