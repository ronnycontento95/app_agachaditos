

import 'package:flutter/foundation.dart';

import '../../domain/repositories/api_interface.dart';
import 'package:dio/dio.dart';

import '../../ui/help/global_label.dart';
import '../response/response_api.dart';
import '../response/response_dishes.dart';
import '../response/response_order.dart';
import '../response/response_order_detail.dart';

class ApiRest implements ApiInterface {
  Dio dio = Dio(BaseOptions(
      baseUrl: GlobalLabel.urlGlobal,
      // connectTimeout: const Duration(seconds: 5),//tiempo de espera de conexión
      // receiveTimeout: const Duration(seconds: 3), //recibirTiempo de espera
      headers: {
        "version": "0.0.1",
      }));

  @override
  Future responseConsultTable(int idUser,
      VoidCallback? Function(int code, dynamic data) callback) async {
    const url = "tables/";
    final data = {"idUser": idUser};

    try {
      final response = await dio.post(
        url,
        data: data,
      );
      if (kDebugMode) {
        print("RESPONSE >>> DATA $response");
      }
      if (response.data == null) {
        if (kDebugMode) {
          print("ERROR >>> DATA NULL TABLE");
        }
      }
      callback(response.data["error"], ResponseApi.fromMap(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('ERROR >>> TABLE $e');
      }
    }
  }

  @override
  Future responsePostDishes(
      VoidCallback? Function(int code, dynamic data) callback) async {
    const url = "dishes";
    dio.options.headers = {"version": "0.0.1"};
    try {
      final response = await dio.post(
        url,
      );
      if (kDebugMode) {
        print("RESPONSE >>> DATA $response");
      }
      if (response.data == null) {
        if (kDebugMode) {
          print("RESPONSE >>> DATA NULL DISHES");
        }
      }
      callback(response.data["error"], ResponseDishes.fromMap(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('ERROR >>> $e');
      }
    }
  }

  @override
  Future responsePostOrder( int idUser,
      VoidCallback? Function(int code, dynamic data) callback) async {
    const url = "orders";
    dio.options.headers = {"version": "0.0.1"};
    final data = {"idUser": idUser};
    try {
      final response = await dio.post(
        url,
        data: data
      );
      if (kDebugMode) {
        print("RESPONSE >>> ORDER $response");
      }
      if (response.data == null) {
        if (kDebugMode) {
          print("RESPONSE >>> DATA NULL ORDER");
        }
      }
      callback(response.data["error"], ResponseOrder.fromMap(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('ERROR >>> $e');
      }
    }
  }

  @override
  Future responsePostOrderDetail( int idOrder,
      VoidCallback? Function(int code, dynamic data) callback) async {
    const url = "orderDetail";
    dio.options.headers = {"version": "0.0.1"};
    final data = {"idOrder": idOrder};
    try {
      final response = await dio.post(
          url,
          data: data
      );
      if (kDebugMode) {
        print("RESPONSE >>> ORDER DETAIL $response");
      }
      if (response.data == null) {
        if (kDebugMode) {
          print("RESPONSE >>> DATA ORDER DETAIL");
        }
      }
      callback(response.data["error"], ResponseOrderDetail.fromMap(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('ERROR >>> $e');
      }
    }
  }
}
