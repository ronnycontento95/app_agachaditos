import 'dart:convert';

import 'response_tables.dart';

class ResponseApi {
  int? error;
  List<L>? l;

  ResponseApi({
    this.error,
    this.l,
  });

  factory ResponseApi.fromJson(String str) => ResponseApi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseApi.fromMap(Map<String, dynamic> json) => ResponseApi(
    error: json["error"],
    l: json["l"] == null ? [] : List<L>.from(json["l"]!.map((x) => L.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "error": error,
    "l": l == null ? [] : List<dynamic>.from(l!.map((x) => x.toMap())),
  };
}

