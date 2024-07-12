class ProductCartModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingCart rating;

  const ProductCartModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductCartModel.fromJson(Map<String, dynamic> json) {
    return ProductCartModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: RatingCart.fromJson(json['rating']),
    );
  }
}

class RatingCart {
  final double rate;
  final int count;

  const RatingCart({
    required this.rate,
    required this.count,
  });

  factory RatingCart.fromJson(Map<String, dynamic> json) {
    return RatingCart(
      rate: json['rate'].toDouble(),
      count: json['count'],
    );
  }
}
