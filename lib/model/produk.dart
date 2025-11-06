class Produk {
  // 1. Definisikan variable yang dibutuhkan
  // 2. Set ke final supaya tidak dapat dirubah setelah dibuat
  final int id;
  final String title;
  final String description;
  final String price;
  final String category;
  final String image;

  // Buat Konstruktor
  Produk({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    });

  // Buat method untuk import dari json
  // Buat method dengan keyword factory
  factory Produk.dariJson(Map<String,dynamic> json){
    return Produk(
      id: json["id"], 
      title: json["title"], 
      description: json["description"], 
      price: json["price"], 
      category: json["category"], 
      image: json["image"],
    );
  }
}