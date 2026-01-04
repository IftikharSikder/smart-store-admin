import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store_admin/features/product/presentation/screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart store Admin',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const ProductScreen(),
    );
  }
}
