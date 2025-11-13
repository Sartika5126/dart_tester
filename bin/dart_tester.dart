import 'package:dart_tester/helper/user_helper.dart';
import 'package:dart_tester/model/user.dart';

void main(List<String> arguments) async {
  print("Sedang mengambil data...");
  List<dynamic> coba = await UserHelper().getAllUser();
  print(coba[0].username);

  // membuat objek untuk menampung data user
  User pengguna = await UserHelper().getUserById(2);
  print(pengguna.username);
  print("Email :${pengguna.email}");

  // membuat user baru 
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
    User hasil = await UserHelper().updateUser(up);
    print("Ini hasil update : $hasil");
}