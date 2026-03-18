class ProductData {
  int id;
  String name;
  String image;
  String type;
  int price;
  int examination; // Rating
  String salle;      // "yes" for best seller
  String description;
  int quantity;

  ProductData({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.price,
    required this.examination,
    required this.salle,
    required this.description,
    this.quantity = 1,
  });

  // ... (toMap and fromMap methods)

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'type': type,
      'price': price,
      'examination': examination,
      'salle': salle,
      'description' : description ,
       'quantity' : quantity
    };
  }

  factory ProductData.fromMap(Map<String, dynamic> map) {
    return ProductData(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      type: map['type'] ?? '',
      price: map['price'] ?? 0,
      examination: map['examination'] ?? 0,
      salle: map['salle'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity'] ?? 1

    );
  }

}


