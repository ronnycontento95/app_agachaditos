import 'package:flutter/foundation.dart';

import '../../domain/repositories/api_interface.dart';

class ProviderPrincipal extends ChangeNotifier{
  ApiInterface apiInterface;
  ProviderPrincipal(this.apiInterface);


  getTable(){
    apiInterface.responseConsultTable(1, (code, data) {
      print('prueba >>>> ingeso $code');
      print('prueba >>>> ingeso $data');
      return null;
    });
  }

  getDishes(){
    apiInterface.responsePostDishes((code, data){
      print('prueba >>>> ingreso $data');
      return null;
    });
  }
}