class Products {
  String? status;
  List<Product>? data;

  Products({this.status, this.data});

  Products.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String? sId;
  String? productName;
  String? productCode;
  String? img;
  String? unitPrice;
  String? qty;
  String? totalPrice;
  String? createdDate;

  Product({this.sId, this.productName, this.productCode, this.img, this.unitPrice, this.qty, this.totalPrice, this.createdDate});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    unitPrice = json['UnitPrice'];
    qty = json['Qty'];
    totalPrice = json['TotalPrice'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ProductName'] = this.productName;
    data['ProductCode'] = this.productCode;
    data['Img'] = this.img;
    data['UnitPrice'] = this.unitPrice;
    data['Qty'] = this.qty;
    data['TotalPrice'] = this.totalPrice;
    data['CreatedDate'] = this.createdDate;
    return data;
  }
}
