import 'package:http/http.dart' as http;
import 'dart:convert';

List<String> catagoriesFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String catagoriesToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

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

Future<List<dynamic>> apiGetCategory(String categories) async {
  var response = await http
      .get(Uri.parse('https://dummyjson.com/products/category/$categories'));

  if (response.statusCode == 200) {
    var list = jsonDecode(response.body) as List<dynamic>;
    return list;
  } else {
    throw Exception('Error');
  }
}
