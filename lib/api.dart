import 'dart:convert';

List<String> catagoriesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String catagoriesToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

CategoriesApi categoriesApiFromJson(String str) =>
    CategoriesApi.fromJson(json.decode(str));

String categoriesApiToJson(CategoriesApi data) => json.encode(data.toJson());

class CategoriesApi {
  List<dynamic>? products;
  int? total;
  int? skip;
  int? limit;

  CategoriesApi({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  factory CategoriesApi.fromJson(Map<String, dynamic> json) => CategoriesApi(
        products: json["products"] == null
            ? []
            : List<dynamic>.from(json["products"]!.map((x) => x)),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products":
            products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}
