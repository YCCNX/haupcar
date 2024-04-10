import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<String>> apiGet() async {
  var response =
      await http.get(Uri.parse('https://dummyjson.com/products/categories'));

  if (response.statusCode == 200) {
    var categories = jsonDecode(response.body) as List<String>;
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
