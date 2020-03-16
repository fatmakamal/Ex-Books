class UserDetails {

  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String userID;
  final String image;
 

  UserDetails({this.firstName, this.lastName, this.phoneNumber, this.email, this.userID,this.image});

    UserDetails.fromData(Map<String, dynamic> data)
      : firstName = data['firstname'],
        lastName = data['lastname'],
        email = data['email'],
        phoneNumber = data['phonenumber'],
        userID = data['uid'],
        image = data['image'] ;


}