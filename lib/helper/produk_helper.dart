import 'package:dart_tester/model/produk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProdukHelper {
  final Map<String,String> _header ={
    "Content-Type":"application/json"
  };

  // method mendapatkan semua data produk 
  Future<List<dynamic>> getAllProduk() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    try {
      var respon = await http.get(url);
      if(respon.statusCode == 200){
        var json = jsonDecode(respon.body);
        return json.map((item)=>Produk.fromMap(item)).toList();
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }

  // method tambah produk baru
  Future<int> createProduk(Produk p) async{
    var url = Uri.parse("https://fakestoreapi.com/products");
    try {
      var respon = await http.post(url,headers: _header,body: jsonEncode(p.toMap()));
      if (respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return json["id"];
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }

  }

  // method ambil data produk berdasarkan id
  Future<Produk> getProdukById(int id) async{
    var url = Uri.parse("https://fakestoreapi.com/products/$id");
    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return Produk.fromMap(json);
      } else {
        int kode = respon.statusCode;
        throw Exception("Error Koneksi Status :$kode");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  }

  // method update produk
  Future<Produk> updateProduk(Produk p) async{
    var url = Uri.parse("https://fakestoreapi.com/products/${p.id}");
    try {
      var respon = await http.put(
        url,
        headers: _header,
        body: jsonEncode(p.toMap()));
      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return Produk.fromMap(json);
      } else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }
  
}