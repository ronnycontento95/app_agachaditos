import 'package:app_agachaditos/data/response/response_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repositories/api_interface.dart';

class ProviderPrincipal extends ChangeNotifier {
  ApiInterface apiInterface;

  ProviderPrincipal(this.apiInterface);
  List<ResponseApi>? listTable = [];

  final FirebaseAuth _auth = FirebaseAuth.instance;


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
        print('>>>>>>>> $credential');
        await _auth.signInWithCredential(credential).then((value)async{
          print('prueba >>>> ${value.user!.displayName} ${value.user!.email}');
        });
      }else{
        print('prueba >>>> error');
      }
    }catch (e){
      print('prueba >>>> $e');

    }
  }

  /// Example code for sign out.
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }
}
