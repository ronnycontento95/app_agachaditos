import 'dart:convert';

class ResponseDishes {
  int? error;
  List<L>? l;

  ResponseDishes({
    this.error,
    this.l,
  });

  factory ResponseDishes.fromJson(String str) => ResponseDishes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDishes.fromMap(Map<String, dynamic> json) => ResponseDishes(
    error: json["error"],
    l: json["l"] == null ? [] : List<L>.from(json["l"]!.map((x) => L.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "error": error,
    "l": l == null ? [] : List<dynamic>.from(l!.map((x) => x.toMap())),
  };
}

class L {
  String? name;
  double? price;
  String? image;

  L({
    this.name,
    this.price,
    this.image,
  });

  factory L.fromJson(String str) => L.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory L.fromMap(Map<String, dynamic> json) => L(
    name: json["name"],
    price: json["price"]?.toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "price": price,
    "image": image,
  };
}
