class Product {
  String? code;
  String? product_name;
  String? image_url;
  String? brands;
  String? categories;
  DateTime? createdAt;
  String? description;

  Product({
    this.code,
    this.product_name,
    this.brands,
    this.image_url,
    this.categories,
    this.createdAt,
    this.description
  });

  Product.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    product_name = json['product_name'];
    brands = json['brands'];
    image_url = json['image_url'];
    categories = json['categories'];
    createdAt = json['createdAt'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['product_name'] = product_name;
    data['brands'] = brands;
    data['image_url'] = image_url;
    data['categories'] = categories;
    data['createdAt'] = createdAt;
    data['description'] = description;
    return data;
  }
}

class ProductDetails {
  String? code;
  Product? product;

  ProductDetails({this.code, this.product});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
