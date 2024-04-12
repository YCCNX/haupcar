import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'api.dart';

class CategoriesPage extends StatefulWidget {
  final String barTitle;
  const CategoriesPage({required this.barTitle, super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late CategoriesApi item;
  var itemList = [];
  var _apiCalling = true;
  var fmt = NumberFormat.decimalPattern();

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
      List<dynamic> a = item.products as List<dynamic>;
      for (var p in a) {
        itemList.add(p);
      }
      _apiCalling = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.barTitle),
        ),
        body: (_apiCalling)
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ))
            : GridView.builder(
                itemCount: itemList.length,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: buildGridTile(index))),
      );

  Widget buildGridTile(int index) => InkWell(
      child: GridTile(
          footer: GridTileBar(
            backgroundColor: const Color.fromARGB(150, 96, 125, 139),
            title: Text(
              itemList[index]['title'],
              textScaler: const TextScaler.linear(1.3),
              maxLines: 1,
            ),
            subtitle: Text(
              '\$${fmt.format(itemList[index]['price'])}',
            ),
            trailing: const Icon(Icons.arrow_forward_ios,
                size: 32, color: Color.fromARGB(150, 255, 255, 255)),
          ),
          child: Image.network(
            itemList[index]['thumbnail'],
          )),
      onTap: () => {});
}
