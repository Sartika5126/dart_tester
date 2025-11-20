import 'dart:convert';

class Produk {
  // 1. Definisikan variable yang dibutuhkan
  // 2. Set ke final supaya tidak dapat dirubah setelah dibuat
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  Produk({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'image': image,
    };
  }

  factory Produk.fromMap(Map<String, dynamic> map) {
    return Produk(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price'].toDouble() ?? '',
      category: map['category'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Produk.fromJson(String source) => Produk.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Produk(id: $id, title: $title, description: $description, price: $price, category: $category, image: $image)';
  }

}
