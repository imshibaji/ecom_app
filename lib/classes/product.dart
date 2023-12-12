class ProductResponse {
  List<Product?>? products;
  int? total;
  int? skip;
  int? limit;

  ProductResponse({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });
  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      final v = json['products'];
      final arr0 = <Product>[];
      v.forEach((v) {
        arr0.add(Product.fromJson(v));
      });
      products = arr0;
    }
    total = json['total']?.toInt();
    skip = json['skip']?.toInt();
    limit = json['limit']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (products != null) {
      final v = products;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['products'] = arr0;
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String?>? images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });
  Product.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    title = json['title']?.toString();
    description = json['description']?.toString();
    price = json['price']?.toInt();
    discountPercentage = json['discountPercentage']?.toDouble();
    rating = json['rating']?.toDouble();
    stock = json['stock']?.toInt();
    brand = json['brand']?.toString();
    category = json['category']?.toString();
    thumbnail = json['thumbnail']?.toString();
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['brand'] = brand;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    if (images != null) {
      final v = images;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['images'] = arr0;
    }
    return data;
  }
}
