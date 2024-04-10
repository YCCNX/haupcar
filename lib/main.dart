import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const NavigationDrawer(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Column(
            children: [
              Text(
                'Language/ภาษา',
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1.5,
              ),
              TextButton(
                onPressed: null,
                child: Text('ไทย'),
              ),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text('data'),
      ),
    );
  }
}
