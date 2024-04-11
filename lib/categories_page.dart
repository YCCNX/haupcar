import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

//สร้างโครงไว้ก่อน เดี้นวมาแก้เรื่องการแสดงผลอีกที
class CategoriesPage extends StatefulWidget {
  final String barTitle;
  const CategoriesPage({required this.barTitle, super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late CategoriesApi item;
  late Product itemList;
  var _apiCalling = true;

  @override
  void initState() {
    super.initState();
    getCategories(widget.barTitle);
  }

  Future<void> getCategories(String str) async {
    var response = await http
        .get(Uri.parse('https://dummyjson.com/products/category/$str'));
    setState(() {
      item = categoriesApiFromJson(response.body);
      itemList = item.products;
      _apiCalling = false;

      print(item.products);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.barTitle),
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.topCenter,
            child: Text('Test')),
      );
}
