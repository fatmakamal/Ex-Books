class OnlineBook {
  String documentId;
  String bookName;
  String authorName;
  String bookImage;
  String category;
  String describtion;
  int price;
  int quantity;
  

 OnlineBook(
      {this.documentId,
      this.bookName,
      this.authorName,
      this.bookImage,
      this.category,
      this.describtion,
      this.price,
      this.quantity
      });

  OnlineBook.fromSnapshot(Map snapshot, String id)
      : documentId = id,
        authorName = snapshot['authorname'],
        bookName = snapshot['bookname'],
        bookImage = snapshot['image'] ?? '',
        describtion = snapshot['decription'] ?? '',
        category = snapshot['category'] ?? '',
        price = snapshot['price'] ?? '',
        quantity = snapshot['quantity'] ?? ''
        
        ;

  toJson() {
    return {
      "authorName": authorName,
      "bookName": bookName,
      "bookImage": bookImage,
      "describtion": describtion,
      "selectedCategory": category,
      "price": price,
      "price": quantity,
          };
  }
}