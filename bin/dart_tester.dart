import 'package:dart_tester/helper/cart_helper.dart';
import 'package:dart_tester/helper/user_helper.dart';
import 'package:dart_tester/model/cart.dart';
import 'package:dart_tester/model/cart_produk.dart';
import 'package:dart_tester/model/user.dart';

import 'package:dart_tester/helper/produk_helper.dart';
import 'package:dart_tester/model/produk.dart';

void main(List<String> arguments) async {
  print("Sedang mengambil data...");

  // Mengambil data semua produk
  List<dynamic> getAllProduk = await ProdukHelper().getAllProduk();
  print(getAllProduk);

  // Tambah Produk Baru
  Produk createProduk = Produk(
    id: 6, 
    title: "Le Minerale", 
    description: "Minuman Asli Dari Pegunungan", 
    price: 5000, 
    category: "minuman", 
    image: "no image");
    int produkBaru = await ProdukHelper().createProduk(createProduk);
    print("id produk yang baru dibuat :$produkBaru");


  // Mengambil Data produk berdasarkan id
  Produk ProdukById = await ProdukHelper().getProdukById(5);
  print("Nama Produk : ${ProdukById.title}");

  // Mengupdate data produk
  Produk updateProduk = Produk(
    id: 6, 
    title: "Le Minerale", 
    description: "Minuman Asli Dari Pegunungan", 
    price: 3000, 
    category: "minuman", 
    image: "no image");
    //simpan hasil respon
    Produk result = await ProdukHelper().updateProduk(updateProduk);
    print("Ini hasil update : $result");


  // Mengamnil Data Semua Cart
  List<Cart> getAllCart = await CartHelper().getAllCart();
  print(getAllCart);

  // Tambah Cart Baru
  List<CartProduk> produkToBuy = [
    CartProduk(productId: 5, quantity: 6),
    CartProduk(productId: 12, quantity: 5),
  ];
  Cart newCart = Cart(id: 1, userId: 5, products: produkToBuy);
  int cartBaru = await CartHelper().createCart(newCart);
  print("id cart baru yang dibuat : $cartBaru");

  // Mengambil Cart berdasarkan ID
  Cart cartById = await CartHelper().getCartById(2);
  print("Cart ID ${cartById.id} : ${cartById.products}");

  // Mengupdate Data Cart 
  //Membuat list CartProduk yang akan di isi
  List<CartProduk> produkToUpdate = [
    CartProduk(productId: 5, quantity: 20),
    CartProduk(productId: 12, quantity: 60),
  ];
  Cart updateCart = Cart(id: 1, userId: 5, products: produkToUpdate);
  Cart hasil = await CartHelper().updateCart(updateCart);
  print("Ini Hasil update : $hasil");

  // Mengambil Data Semua User
  List<dynamic> coba = await UserHelper().getAllUser();
  print(coba);

  // Mengambil User Berdasarkan ID
  User pengguna = await UserHelper().getUserById(2);
  print(pengguna.username);
  print("Email :${pengguna.email}");

  // Membuat user baru 
    User p = User(
      id: 10, 
      username: "sartika", 
      email: "sartika@gmail.com", 
      password: "051206");
      // kirim data ke endpoint
      int idUserBaru = await UserHelper().creatUser(p);
      print("id user yang baru dibuat :$idUserBaru");

  // mengupdate user baru
    User up = User(
      id: 2, 
      username: "dzakwan", 
      email: "dzakwan@gmail.com", 
      password: "22025");
      //simpan hasil respon
      User update = await UserHelper().updateUser(up);
      print("Ini hasil update : $update");
}
