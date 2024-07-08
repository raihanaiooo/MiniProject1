class Cart {
  final int id;
  final int userId;
  final String date;

  const Cart({required this.id, required this.userId, required this.date});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'userId': int userId,
        'date': String date,
      } =>
        Cart(id: id, userId: userId, date: date),
      _ => throw const FormatException("Fetching failed!"),
    };
  }
}
