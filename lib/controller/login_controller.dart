import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pas_flutter/models/login_model.dart';
import 'package:pas_flutter/routes.dart';

class LoginController extends GetxController{

  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
   var isLoading = false.obs;

  var loginModel = Rxn<LoginModel>();

  // method hit API
  void login() async{
    if(txtUsername.text.toString().isEmpty || txtPassword.text.toString().isEmpty){
      Get.snackbar("error", "username dan password harus terisi");
    }else{

      try {
        
        isLoading.value = true; // sebagai tanda di page nya muncul loading widget
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(url, body: {
          "username" : txtUsername.text.toString(),
          "password" : txtPassword.text.toString()
        });

        isLoading.value = false;
        if(response.statusCode == 200){
          // kita ambil jsonnya message pindah tampilan ke main menu
          // contoh json yang paling sederhana, next pertemuan json yang kompleks
          loginModel.value = loginModelFromJson(response.body);
          
          if(loginModel.value?.status == true){
            Get.snackbar("berhasil", loginModel.value!.message.toString());
            Get.offAllNamed(Routes.homePage);
          }else{
            Get.snackbar("gagal", loginModel.value!.message.toString());
          }

        }else{
          Get.snackbar("gagal", "cek internet connection");
        }



      } catch (e) {
        isLoading.value = false;
        Get.snackbar("gagal", e.toString());
      }

    }
  }

}