import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/resources/strings.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductsRepository {
  final Dio _dio = Dio();

  Future<dynamic> loadProductsFromApi() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: Strings.noInternet,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return null;
    }

    try {
      var response = await _dio.get("https://fakestoreapi.com/products");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(
            'Error ${response.statusCode}: ${response.statusMessage}');
      }
    } catch (error) {
      Fluttertoast.showToast(
        msg: Strings.loadProductFailure,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[700],
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return null;
    }
  }
}
