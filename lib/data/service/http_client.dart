// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quanta/bindings/models/mongodb_models.dart';
import 'package:quanta/common/widgets/interface/snack_bar.dart';

class MongoDBclass extends GetxController {
  // fetch all products
  Future<List<MongoDBmodel>> fetchMongoDB() async {
    String productsUrl = dotenv.env['PRODUCTS'].toString();
    http.Response response = await http.get(
      Uri.tryParse(productsUrl)!,
    );
    // print(response);
    List<dynamic> mongodbres = jsonDecode(response.body);
    // print(mongodbres);
    List<MongoDBmodel> mongodbOut =
        mongodbres.map((dynamic e) => MongoDBmodel.fromJson(e)).toList();
    return mongodbOut;
  }

  // fetch products by id
  Future<ProductDetailModel> fetchProductDetail(String id) async {
    String productdetailsUrl = dotenv.env['PRODUCT_DETAILS'].toString();
    http.Response response = await http.get(
      Uri.tryParse('$productdetailsUrl$id')!,
    );

    final productRes = jsonDecode(response.body);
    final productDetailById = ProductDetailModel.fromJson(productRes);
    return productDetailById;
  }

  // fetch similar products
  Future<List<SimilarProductsModel>> fetchSimilarProducts(String id) async {
    String similarproductsUrl = dotenv.env['SIMILAR_PRODUCTS'].toString();
    http.Response response = await http.get(
      Uri.tryParse('$similarproductsUrl$id')!,
    );

    List<dynamic> similarproductRes = jsonDecode(response.body);
    List<SimilarProductsModel> similarproductModel = similarproductRes
        .map((dynamic e) => SimilarProductsModel.fromJson(e))
        .toList();
    return similarproductModel;
  }

  // Add prducts to DB from amazon URL
  Future<void> insertproductURL(String url) async {
    String addproductUrl = dotenv.env['ADD_PRODUCT_DATA'].toString();
    http.Response response = await http.post(
      Uri.tryParse(addproductUrl)!,
      body: jsonEncode({'url': url}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      SnackBarClass().successSnack();
    } else if (response.statusCode == 404) {
      SnackBarClass().errorSnack(response.statusCode);
    } else {
      throw Exception('Error while getting product');
    }
  }

  // Add user email
  Future<void> insertEmail(String productid, String email) async {
    String emailNotifyUrl = dotenv.env['EMAIL_NOTIFY_PRODUCT'].toString();
    http.Response response = await http.post(
      Uri.tryParse(emailNotifyUrl)!,
      body: jsonEncode({'productId': productid, 'email': email}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      SnackBarClass().successSnack();
    } else if (response.statusCode == 404) {
      SnackBarClass().errorSnack(response.statusCode);
    } else {
      throw Exception('Error while getting product');
    }
  }
}
