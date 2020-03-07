
class Book {
  String documentId;
  String uid;
  String bookName;
  String authorName;
  String bookImage;
  String selectedCategory;
  String describtion;

  Book(
      {this.documentId,
      this.bookName,
      this.authorName,
      this.bookImage,
      this.selectedCategory,
      this.describtion,
      this.uid});

  Book.fromSnapshot(Map snapshot, String id)
      : documentId = id,
        authorName = snapshot['authorname'],
        bookName = snapshot['bookname'],
        bookImage = snapshot['image'] ?? '',
        describtion = snapshot['decription'] ?? '',
        selectedCategory = snapshot['category'] ?? '',
        uid = snapshot['uid'];

  toJson() {
    return {
      "authorName": authorName,
      "bookName": bookName,
      "bookImage": bookImage,
      "describtion": describtion,
      "selectedCategory": selectedCategory,
      "uid": uid
    };
  }
}
