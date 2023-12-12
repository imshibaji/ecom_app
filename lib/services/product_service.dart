import 'dart:convert';
import 'package:ecom_app/classes/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String url = 'https://dummyjson.com/products';
  Future<List<Product>> getAllProducts() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      ProductResponse responseData =
          ProductResponse.fromJson(jsonDecode(response.body));
      List<Product?> products = responseData.products!;
      return products.map((value) => value!).toList();
    }
    return [];
  }

  Future<Product> getProductById(int id) async {
    var response = await http.get(Uri.parse('$url/$id'));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      Product product = Product.fromJson(responseData);
      return product;
    }
    return Product();
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    var response = await http.get(Uri.parse('$url/category/$category'));
    if (response.statusCode == 200) {
      List responseData = json.decode(response.body);
      List<Product> products =
          responseData.map((values) => Product.fromJson(values)).toList();
      return products;
    }
    return [];
  }

  Future<List<Product>> getProductsByBrand(String brand) async {
    var response = await http.get(Uri.parse('$url/brand/$brand'));
    if (response.statusCode == 200) {
      List responseData = json.decode(response.body);
      List<Product> products =
          responseData.map((value) => Product.fromJson(value)).toList();
      return products;
    }
    return [];
  }

  Future addProduct(Product product) async {
    var response = await http.post(
      Uri.parse(url),
      body: json.encode(product.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future updateProduct(Product product) async {
    var response = await http.put(
      Uri.parse('$url/${product.id}'),
      body: json.encode(product.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future deleteProduct(int id) async {
    var response = await http.delete(Uri.parse('$url/$id'));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
