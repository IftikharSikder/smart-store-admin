import 'package:get/get.dart';
import 'package:smart_store_admin/features/product/data/models/product_model.dart';
import 'package:smart_store_admin/features/product/data/services/product_service.dart';

class ProductController extends GetxController implements GetxService {
  ProductService productService;
  ProductController(this.productService);

  List<Product>? _productList;
  List<Product>? get productList => _productList;

  Future<void> getProducts() async {
    _productList = await productService.fetchProduct();
    update();
  }
}
