import 'dart:convert';




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

  @override
  String toJson() => json.encode(toMap());

  factory L.fromMap(Map<String, dynamic> json) => L(
    name: json["name"],
  );

  @override
  Map<String, dynamic> toMap() => {
    "name": name,
  };
}
