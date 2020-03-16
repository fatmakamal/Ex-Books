class Book {
  String documentId;
  String uid;
  String bookName;
  String authorName;
  String bookImage;
  String selectedCategory;
  String describtion;
  String userName ; 
  String userImage ;

  Book(
      {this.documentId,
      this.bookName,
      this.authorName,
      this.bookImage,
      this.selectedCategory,
      this.describtion,
      this.uid,
      this.userName,
      this.userImage});

  Book.fromSnapshot(Map snapshot, String id)
      : documentId = id,
        authorName = snapshot['authorname'],
        bookName = snapshot['bookname'],
        bookImage = snapshot['image'] ?? '',
        describtion = snapshot['decription'] ?? '',
        selectedCategory = snapshot['category'] ?? '',
        uid = snapshot['uid'],
        userImage = snapshot['userimage'],
        userName = snapshot['username'];

  toJson() {
    return {
      "authorName": authorName,
      "bookName": bookName,
      "bookImage": bookImage,
      "describtion": describtion,
      "selectedCategory": selectedCategory,
      "uid": uid,
      "userimage": userImage,
      "userName": userName,
          };
  }
}