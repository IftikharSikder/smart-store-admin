import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smart_store_admin/core/utils/widgets/custom_appbar.dart';
import 'package:smart_store_admin/core/utils/widgets/product_widgets.dart';
import 'package:smart_store_admin/features/product/data/controllers/product_controller.dart';
import 'package:smart_store_admin/features/product/data/models/product_model.dart';
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
      appBar: CustomAppbar(title: 'Product Screen', bgColor: Theme.of(context).primaryColor, isCenter: true),
      body: GetBuilder<ProductController>(
        builder: (productController) {
          final productList = productController.productList;
          /*return productList == null
              ? Center(child: CircularProgressIndicator())
              : productList.isEmpty
              ? Text("No Product Found")
              : Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 10),
                  child: GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return ProductWidgets(product: productList[index]);
                    },
                  ),
                );*/
          return Skeletonizer(
            enabled: productList == null ? true : false,
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, right: 10),
              child: GridView.builder(
                itemCount: productList == null ? 8 : productList?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  // return ProductWidgets(product: productList![index]);
                  /*if (productController.productList == null) {
                    return ProductWidgets(product: Product(img: ''));
                  } else if (productController.productList!.isEmpty) {
                    return Text("No product fount");
                  } else {
                    return ProductWidgets(product: productList![index]);
                  }*/
                  return productList == null
                      ? ProductWidgets(product: Product(img: ''))
                      : productList.isEmpty
                      ? Center(child: Text('No prouduct found'))
                      : ProductWidgets(product: productList[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
