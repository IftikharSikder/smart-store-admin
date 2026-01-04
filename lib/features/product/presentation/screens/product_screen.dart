import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store_admin/features/product/data/controllers/product_controller.dart';
import 'package:smart_store_admin/features/product/data/services/product_service.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productController = Get.put(ProductController(ProductService()));

  @override
  void initState() {
    super.initState();
    productController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductController>(
        builder: (productController) {
          final productList = productController.productList;
          if (productList == null) {
            return Center(child: CircularProgressIndicator());
          } else if (productList.isEmpty) {
            return Center(child: Text("No product found"));
          } else {
            return ListView.builder(
              itemCount: productController.productList!.length,
              itemBuilder: (context, index) {
                final products = productController.productList;
                return ListTile(title: Text(products![index].sId.toString()));
              },
            );
          }
        },
      ),
    );
  }
}
