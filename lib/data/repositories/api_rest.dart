import 'dart:io';
import 'dart:ui';

import 'package:app_agachaditos/ui/help/global_label.dart';
import 'package:flutter/foundation.dart';

import '../../domain/repositories/api_interface.dart';
import 'package:dio/dio.dart';

class ApiRest implements ApiInterface {

  Dio dio = Dio(BaseOptions(
    baseUrl: GlobalLabel.urlGlobal,
    // connectTimeout: const Duration(seconds: 5),//tiempo de espera de conexión
    // receiveTimeout: const Duration(seconds: 3), //recibirTiempo de espera
    headers: {"version": "0.0.1",}
  ));


  @override
  Future responseConsultTable(int idUser,
      VoidCallback? Function(int code, dynamic data) callback) async {
    const url = "tables/";
    final data = {"idUser": idUser};

    try {
      // 404
      await dio.post(url);
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      print("RESPONSE >>> DATA ${e.response!.data["error"]}");
      callback(e.response!.data["error"], e.response!.data["error"]);

      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }

    try {
      print('url >>>> ${url}');
      final response = await dio.post(
        url,
        data: data,
      );
      if (kDebugMode) {
        print("RESPONSE >>> DATA ${response}");
      }
    } on DioError catch (e) {
      print('ERROR >>> $e');
    }
  }

  @override
  Future responsePostDishes(VoidCallback? Function(int code, dynamic data) callback) async {
    const url = "http://146.190.131.188:3001/dishes";
    dio.options.headers = {"version": "0.0.1"};
    try {
      print('responsePostDishes >>>> ${url}');
      final response = await dio.post(
        url,
      );
      if (kDebugMode) {
        print("RESPONSE >>> DATA ${response}");
      }
    } on DioError catch (e) {
      print('ERROR >>> $e');
    }

  }
}
