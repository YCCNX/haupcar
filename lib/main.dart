import 'package:flutter/material.dart';
import 'package:haupcar/categories_page.dart';
import 'package:haupcar/hamberger_menu.dart';
import 'package:haupcar/api.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

//Use Flutter:Launch Emulator (Pixel 7 (android-x64)) Test!!
void main() => runApp(const AppHaupCar());

class AppHaupCar extends StatelessWidget {
  const AppHaupCar({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: HomePage(),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<String>> futureCategories;
  List<String> categoriesList = [];
  var _apiCalling = true;
  //ข้อมูลไม่ยอมแสดงผล
  //ต้องมีการอัปเดตหลังจากรันแอปถึงจะมีข้อมูลแสดงผล
  @override
  void initState() {
    super.initState();
    getCategories();
    // setState(() {

    //   print("1");
    //   print(categoriesList);
    // });
  }

  Future<void> getCategories() async {
    var response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    setState(() {
      categoriesList = catagoriesFromJson(response.body);
      _apiCalling = false;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   futureCategories = apiGet();

  //   setState(() {
  //     _apiCalling = false;
  //     futureCategories.then((value) {
  //       for (var p in value) {
  //         categoriesList.add(p);
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: hambergerMenu(),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: (_apiCalling
              ? const Center(child: CircularProgressIndicator())
              : builListView()),
        ),
      );

  Widget builListView() => ListView.separated(
        itemCount: categoriesList.length,
        itemBuilder: (context, index) => buildListTile(index),
        separatorBuilder: (conter, index) => const Divider(
          thickness: 1,
          color: Colors.blueAccent,
        ),
      );

  Widget buildListTile(int index) => ListTile(
        contentPadding: const EdgeInsets.only(top: 5, bottom: 5),
        title: Text(categoriesList[index]),
        trailing: const Icon(Icons.arrow_forward),
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
