import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_store_admin/features/product/data/controllers/product_controller.dart';
import 'package:smart_store_admin/features/product/data/services/product_service.dart';
import 'package:smart_store_admin/features/product/presentation/widgets/product_widgets.dart';

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
          return productList == null
              ? Center(child: CircularProgressIndicator())
              : productList.isEmpty
              ? Text("No Product Fount")
              : ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return ProductWidgets(product: productList[index]);
                  },
                );
        },
      ),
    );
  }
}
