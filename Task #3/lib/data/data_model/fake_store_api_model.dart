class ProductDataModel {
  int? id;
  String? title;
  String? description;
  double? price;
  String? category;
  String? image;
  double? rating;
  int? ratingCount;

  ProductDataModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.category,
    this.image,
    this.rating,
    this.ratingCount,
  });

  factory ProductDataModel.fromMapJson(Map<String, dynamic> map) {
    return ProductDataModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: (map['price'] is int) ? (map['price'] as int).toDouble() : map['price'],
      category: map['category'],
      image: map['image'],
      rating: map['rating'] != null ? (map['rating']['rate'] is int ? (map['rating']['rate'] as int).toDouble() : map['rating']['rate']) : null,
      ratingCount: map['rating'] != null ? map['rating']['count'] : null,
    );
  }
}
