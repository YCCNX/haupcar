import 'dart:convert';

//quicktype.io ช่วยแปลงมา
List<String> catagoriesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String catagoriesToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

CategoriesApi categoriesApiFromJson(String str) =>
    CategoriesApi.fromJson(json.decode(str));

String categoriesApiToJson(CategoriesApi data) => json.encode(data.toJson());

class CategoriesApi {
  List<Product>? products;
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
            : List<Product>.from(
                json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Product {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}


//ไม่ได้ใช้แล้ว
// Future<List<dynamic>> apiGet() async {
//   var response =
//       await http.get(Uri.parse('https://dummyjson.com/products/categories'));

//   if (response.statusCode == 200) {
//     var categories = jsonDecode(response.body) as List<dynamic>;

//     return categories;
//   } else {
//     throw Exception('Error');
//   }
// }

// Future<Map<String, dynamic>> apiGetCategory(String str) async {
//   var response =
//       await http.get(Uri.parse('https://dummyjson.com/products/category/$str'));

//   if (response.statusCode == 200) {
//     var list = jsonDecode(response.body) as Map<String, dynamic>;
//     return list;
//   } else {
//     throw Exception('Error');
//   }
// }


