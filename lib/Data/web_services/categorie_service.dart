import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_project_flutter/constants/strings.dart';

class CategorieService {
  late Dio dio;

  CategorieService() {
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 20 * 1000);
    dio = Dio(options);
  }
  Future<List<dynamic>> getCategories() async {
    try {
      Response response = await dio.get('categories');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<Map<String, dynamic>> postCategorie(String nom, dynamic image) async {
    var params = {
      "nomcategorie": nom,
      "imagecategorie": image,
    };
    Response response = await dio.post(
      'categories',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );
    return response.data;
  }
}
