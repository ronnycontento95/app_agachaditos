import 'dart:convert';

import 'package:app_agachaditos/data/response/response_api.dart';

class L  extends ResponseApi{
  String? name;

  L({
    this.name,
  });


  @override
  String toString() {
    return 'L{name: $name}';
  }

  factory L.fromJson(String str) => L.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory L.fromMap(Map<String, dynamic> json) => L(
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
  };
}
