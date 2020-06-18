class Cart {
  String documentId;
  String uid;
  String bookName;
  String bookImage;
  int quantity;
  int price;

  Cart({
    this.documentId,
    this.bookName,
    this.quantity,
    this.bookImage,
    this.price,
    this.uid,
  });

  Cart.fromSnapshot(Map snapshot, String id)
      : documentId = id,
        bookName = snapshot['bookname'],
        bookImage = snapshot['image'] ?? '',
        price = snapshot['price'],
        quantity = snapshot['quantity'],
        uid = snapshot['uid'];

  toJson() {
    return {
      "bookName": bookName,
      "bookImage": bookImage,
      "price": price,
      "quantity": quantity,
      "uid": uid,
    };
  }
}
