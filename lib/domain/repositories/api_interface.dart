import 'dart:ui';

abstract class ApiInterface {
  Future responseConsultTable(
      int idUser, VoidCallback? Function(int code, dynamic data) callback);

  Future responsePostDishes(
      VoidCallback? Function(int code, dynamic data) callback);

  Future responsePostOrder( int idUser,
      VoidCallback? Function(int code, dynamic data) callback);

  Future responsePostOrderDetail( int idOrder,
      VoidCallback? Function(int code, dynamic data) callback);
}
