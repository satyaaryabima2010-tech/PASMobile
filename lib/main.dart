import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pas_flutter/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Belajar Flutter pplg 3',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginPage,
      getPages: Routes.pages,
    );
  }
}