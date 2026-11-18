import 'package:pas_flutter/models/list_model.dart';
import 'package:get/get.dart';



class DetailListProdukController extends GetxController {
  late String namaProduk;
  late String harga;
  late String foto;
  late String deskripsi;

  @override
  void onInit() {
    super.onInit();

      final produk = Get.arguments as ProdukModel;

      namaProduk = produk.namaProduk;
      harga = produk.harga;
      foto = produk.foto;
      deskripsi = produk.deskripsi;

  
  }
}