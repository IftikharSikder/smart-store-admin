import 'package:flutter/material.dart';
import 'package:smart_store_admin/core/utils/app_images/images.dart';
import 'package:smart_store_admin/features/product/data/models/product_model.dart';

class ProductWidgets extends StatelessWidget {
  final Product? product;
  const ProductWidgets({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    print(product!.img);
    return Container(child: product?.img == null ? Image.asset(Images.placeholder) : Image.network(product?.img ?? ""));
  }
}
