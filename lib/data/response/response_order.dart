import 'dart:convert';

class ResponseOrder {
  int? error;
  List<Order>? l;

  ResponseOrder({
    this.error,
    this.l,
  });

  factory ResponseOrder.fromJson(String str) => ResponseOrder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseOrder.fromMap(Map<String, dynamic> json) => ResponseOrder(
    error: json["error"],
    l: json["l"] == null ? [] : List<Order>.from(json["l"]!.map((x) => Order.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "error": error,
    "l": l == null ? [] : List<dynamic>.from(l!.map((x) => x.toMap())),
  };
}

class Order {
  int? idOrder;
  String? name;
  String? waitress;
  double? price;
  int? status;

  Order({
    this.idOrder,
    this.name,
    this.waitress,
    this.price,
    this.status,
  });

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
    idOrder: json["idOrder"],
    name: json["name"],
    waitress: json["waitress"],
    price: json["price"]?.toDouble(),
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "idOrder": idOrder,
    "name": name,
    "waitress": waitress,
    "price": price,
    "status": status,
  };
}
