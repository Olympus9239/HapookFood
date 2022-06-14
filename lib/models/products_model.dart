// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.totalSize,
    required   this.typeId,
    required this.offset,
    required  this.products,
  });

  int totalSize;
  int typeId;
  int offset;
late   List<ProductModel> products;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    totalSize: json["total_size"],
    typeId: json["type_id"],
    offset: json["offset"],
    products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_size": totalSize,
    "type_id": typeId,
    "offset": offset,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class ProductModel {
  ProductModel({
    required    this.id,
    required   this.name,
    required   this.description,
    required  this.price,
    required  this.stars,
    required  this.img,
    required  this.location,
    required   this.createdAt,
    required   this.updatedAt,
    required    this.typeId,
  });

  int id;
  String name;
  String description;
  int price;
  int stars;
  String img;
  String location;
  DateTime createdAt;
  DateTime updatedAt;
  int typeId;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    stars: json["stars"],
    img: json["img"],
    location: json["location"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    typeId: json["type_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "stars": stars,
    "img": img,
    "location": location,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "type_id": typeId,
  };
}
