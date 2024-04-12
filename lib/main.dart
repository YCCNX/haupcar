import 'package:flutter/material.dart';
import 'package:haupcar/categories_page.dart';
import 'package:haupcar/hamberger_menu.dart';
import 'package:haupcar/api.dart';
import 'package:haupcar/locale_string.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

void main() => runApp(const AppHaupCar());

class AppHaupCar extends StatelessWidget {
  const AppHaupCar({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        translations: LocaleString(),
        locale: const Locale('US', 'en'),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: const HomePage(),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoriesList = [];
  var _apiCalling = true;

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  Future<void> getCategories() async {
    var response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    setState(() {
      categoriesList = catagoriesFromJson(response.body);
      _apiCalling = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Home'.tr),
        ),
        drawer: hambergerMenu(),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: (_apiCalling
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.blueGrey,
                ))
              : builListView()),
        ),
      );

  Widget builListView() => ListView.separated(
        itemCount: categoriesList.length,
        itemBuilder: (context, index) => buildListTile(index),
        separatorBuilder: (conter, index) => const Divider(
          thickness: 1,
          color: Colors.blueGrey,
        ),
      );

  Widget buildListTile(int index) => ListTile(
        contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
        title: Text(
          categoriesList[index],
        ),
        trailing: const Icon(
          Icons.arrow_forward,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CategoriesPage(barTitle: categoriesList[index]),
            ),
          );
        },
      );
}
