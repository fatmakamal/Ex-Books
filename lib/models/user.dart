class User{

final String uid;
final String firstname;
final String lastname;
final String image;
final String phonenumber ;



User({this.uid,this.firstname,this.lastname,this.image,this.phonenumber});

User.fromSnapshot(Map snapshot)
      : 
        uid = snapshot['uid'],
        firstname = snapshot['firstname'],
        lastname = snapshot['lastname'],
        image = snapshot['image'],
        phonenumber = snapshot['phonenumber'];



  toJson() {
    return {
      "uid": uid,
      "firstname" : firstname,
      "lasname" : lastname,
      "image" : image,
      "phonenumber" : phonenumber
    };
  }


}