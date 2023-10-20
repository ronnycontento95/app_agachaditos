import 'dart:convert';

class ResponseOrderDetail {
  int? error;
  List<OrderDetail>? l;

  ResponseOrderDetail({
    this.error,
    this.l,
  });

  factory ResponseOrderDetail.fromJson(String str) => ResponseOrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseOrderDetail.fromMap(Map<String, dynamic> json) => ResponseOrderDetail(
    error: json["error"],
    l: json["l"] == null ? [] : List<OrderDetail>.from(json["l"]!.map((x) => OrderDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "error": error,
    "l": l == null ? [] : List<dynamic>.from(l!.map((x) => x.toMap())),
  };
}

class OrderDetail {
  int? idOrderDetail;
  int? quantity;
  double? unitPrice;
  double? price;
  String? name;

  OrderDetail({
    this.idOrderDetail,
    this.quantity,
    this.unitPrice,
    this.price,
    this.name,
  });

  factory OrderDetail.fromJson(String str) => OrderDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderDetail.fromMap(Map<String, dynamic> json) => OrderDetail(
    idOrderDetail: json["idOrderDetail"],
    quantity: json["quantity"],
    unitPrice: json["unit_price"]?.toDouble(),
    price: json["price"]?.toDouble(),
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "idOrderDetail": idOrderDetail,
    "quantity": quantity,
    "unit_price": unitPrice,
    "price": price,
    "name": name,
  };
}
