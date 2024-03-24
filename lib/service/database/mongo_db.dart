// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quanta/service/models/mongodb_models.dart';

class MongoDBclass extends GetxController {
  Future<List<MongoDBmodel>> fetchMongoDB() async {
    http.Response response = await http.get(
      Uri.tryParse('https://server-b848.onrender.com/products')!,
    );
    // print(response);
    List<dynamic> mongodbres = jsonDecode(response.body);
    // print(mongodbres);
    List<MongoDBmodel> mongodbOut =
        mongodbres.map((dynamic e) => MongoDBmodel.fromJson(e)).toList();
    return mongodbOut;
  }
}
