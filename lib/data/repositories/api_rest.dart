import 'dart:io';
import 'dart:ui';

import 'package:app_agachaditos/data/response/response_api.dart';
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
      final response = await dio.post(
        url,
        data: data,
      );
      if (kDebugMode) {
        print("RESPONSE >>> DATA ${response}");
      }
      if(response.data == null){
        if (kDebugMode) {
          print("ERROR >>> DATA NULL TABLE");
        }
      }
      callback(response.data["error"],  ResponseApi.fromMap(response.data));
    } on DioException catch (e) {
      if (kDebugMode) {
        print('ERROR >>> TABLE $e');
      }
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
