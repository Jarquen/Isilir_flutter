class Product {
  String? code;
  String? generic_name;
  String? image_url;
  String? brands;
  String? conservation_conditions_fr;

  Product({
    this.code,
    this.generic_name,
    this.brands,
    this.image_url,
    this.conservation_conditions_fr
  });

  Product.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    generic_name = json['generic_name'];
    brands = json['brands'];
    image_url = json['image_url'];
    conservation_conditions_fr = json['conservation_conditions_fr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['generic_name'] = generic_name;
    data['brands'] = brands;
    data['image_url'] = image_url;
    data['conservation_conditions_fr'] = conservation_conditions_fr;
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
