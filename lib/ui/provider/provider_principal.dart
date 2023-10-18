import 'package:app_agachaditos/data/response/response_api.dart';
import 'package:flutter/foundation.dart';

import '../../domain/repositories/api_interface.dart';

class ProviderPrincipal extends ChangeNotifier {
  ApiInterface apiInterface;

  ProviderPrincipal(this.apiInterface);
  List<ResponseApi>? listTable = [];

  getTable() {
    apiInterface.responseConsultTable(1, (code, data) {
      if (code == 0) {
        addListTable(data);
      }
      return null;
    });
  }

  addListTable(ResponseApi table){
    if(listTable!.isNotEmpty) listTable!.clear();
    print('PRUEBA >>> INGRESO ${table.toJson()}');
    listTable!.add(table);
    notifyListeners();
  }

  getDishes() {
    apiInterface.responsePostDishes((code, data) {
      print('prueba >>>> ingreso $data');
      return null;
    });
  }
}
