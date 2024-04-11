import 'package:http/http.dart' as http;
import 'dart:convert';

//quicktype.io ช่วยแปลงมา
List<String> catagoriesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String catagoriesToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

//ไม่ได้ใช้แล้ว
Future<List<dynamic>> apiGet() async {
  var response =
      await http.get(Uri.parse('https://dummyjson.com/products/categories'));

  if (response.statusCode == 200) {
    var categories = jsonDecode(response.body) as List<dynamic>;

    return categories;
  } else {
    throw Exception('Error');
  }
}

Future<Map<String, dynamic>> apiGetCategory(String str) async {
  var response =
      await http.get(Uri.parse('https://dummyjson.com/products/category/$str'));

  if (response.statusCode == 200) {
    var list = jsonDecode(response.body) as Map<String, dynamic>;
    return list;
  } else {
    throw Exception('Error');
  }
}
