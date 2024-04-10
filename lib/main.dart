import 'package:flutter/material.dart';
import 'package:haupcar/api.dart';
import 'package:haupcar/hamberger_menu.dart';

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
  var categoriesList = [];
  var _apiCalling = true;

  @override
  void initState() {
    super.initState();
    futureCategories = apiGet();

    futureCategories.then((value) {
      for (var p in value) {
        categoriesList.add(p);
      }
    });
    setState(() {
      _apiCalling = false;
    });
  }

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
      );
}
