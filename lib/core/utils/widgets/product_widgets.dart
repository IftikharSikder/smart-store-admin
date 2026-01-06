import 'package:flutter/material.dart';
import 'package:smart_store_admin/core/constants/images.dart';
import 'package:smart_store_admin/core/utils/validator.dart';
import 'package:smart_store_admin/features/product/data/models/product_model.dart';

class ProductWidgets extends StatelessWidget {
  final Product product;
  const ProductWidgets({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 10),
      child: Validator.isValidImgUrl(url: product.img.toString()) ? Image.network(product.img.toString()) : Image.asset(Images.placeholder),
    );
  }
}
