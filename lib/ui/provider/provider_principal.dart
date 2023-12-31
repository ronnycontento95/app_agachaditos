
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/response/response_api.dart';
import '../../data/response/response_dishes.dart';
import '../../data/response/response_order.dart';
import '../../data/response/response_order_detail.dart';
import '../../domain/repositories/api_interface.dart';

class ProviderPrincipal extends ChangeNotifier {
  ApiInterface apiInterface;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ProviderPrincipal(this.apiInterface);
  List<ResponseApi>? listTable = [];
  List<L>? listDishes = [];
  List<Order>? listOrder = [];
  List<OrderDetail>? listOrderDetail = [];
  int _selectedIndex = 0;
  int _numberDishes = 1;

  int get numberDishes => _numberDishes;

  set numberDishes(int value) {
    _numberDishes = value;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  getTable() {
    apiInterface.responseConsultTable(1, (code, data) {
      if (code == 0) {
        addListTable(data);
      }
      return null;
    });
  }

  getDishes() {
    apiInterface.responsePostDishes((code, data) {
      addListDishes(data);
      return null;
    });
  }

  getOrder() {
    apiInterface.responsePostOrder(1, (code, data) {
      addListOrder(data);
      return null;
    });
  }

  orderDetail(int idOrder){
    apiInterface.responsePostOrderDetail(idOrder, (code, data){
      addListOrderDetail(data);
      return null;
    });
  }
  addListOrderDetail(ResponseOrderDetail responseOrderDetail){
    if(listOrderDetail!.isNotEmpty) listOrderDetail!.clear();
    listOrderDetail!.addAll(responseOrderDetail.l!);
    notifyListeners();
  }

  addListTable(ResponseApi table){
    if(listTable!.isNotEmpty) listTable!.clear();
    listTable!.add(table);
    notifyListeners();
  }

  addListOrder(ResponseOrder responseOrder){
    if(listOrder!.isNotEmpty) listOrder!.clear();
    listOrder!.addAll(responseOrder.l!);
    notifyListeners();
  }

  addListDishes(ResponseDishes responseDishes){
    if(listDishes!.isNotEmpty) listDishes!.clear();
    listDishes!.addAll(responseDishes.l!);
    notifyListeners();
  }

  signInWithGoogle() async {
    try{
      await Future.delayed(const Duration(milliseconds: 300));
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser!=null){
        signOut();
      }
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      if (googleAuth != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential).then((value)async{
        });
      }else{
        if (kDebugMode) {
          print('prueba >>>> error');
        }
      }
    }catch (e){
      if (kDebugMode) {
        print('prueba >>>> $e');
      }

    }
  }

  /// Example code for sign out.
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
