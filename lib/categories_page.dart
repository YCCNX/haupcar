import 'package:flutter/material.dart';
import 'api.dart';

//สร้างโครงไว้ก่อน เดี้นวมาแก้เรื่องการแสดงผลอีกที
class CategoriesPage extends StatefulWidget {
  final String barTitle;
  const CategoriesPage({required this.barTitle, super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late Future<Map<String, dynamic>> item;
  var _url = '';
  var _title = '';
  var _apiCalling = true;

  @override
  void initState() {
    super.initState();
    //item = apiGetCategory();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.barTitle),
        ),
      );
}
