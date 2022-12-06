import 'package:flutter/material.dart';
import 'package:my_project_flutter/Presentation/app_router.dart';
import 'package:my_project_flutter/Presentation/widget/my_drawer.dart';
import 'package:my_project_flutter/Presentation/widget/my_menu.dart';
import 'package:my_project_flutter/constants/strings.dart';

AppRouter appRouter = AppRouter();

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    onGenerateRoute: appRouter.generateRoute,
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Moto-Store'),
          backgroundColor: Colors.green[800],
        ),
        backgroundColor: Colors.green[100],
        drawer: const MyDrawer(),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: GridView.count(crossAxisCount: 2, children: <Widget>[
            MyMenu(
                title: "Home", icon: Icons.home, warna: Colors.red, cible: "/"),
            MyMenu(
                title: "Products",
                icon: Icons.shop_sharp,
                warna: Colors.brown,
                cible: "/"),
            MyMenu(
                title: "Categories",
                icon: Icons.assignment_rounded,
                warna: Colors.blue,
                cible: categorieScreen),
            MyMenu(
                title: "Sub Categories",
                icon: Icons.fact_check_sharp,
                warna: Colors.orange,
                cible: "/"),
            MyMenu(
                title: "Orders",
                icon: Icons.auto_awesome_motion,
                warna: Colors.purple,
                cible: "/"),
            MyMenu(
                title: "PDF",
                icon: Icons.archive_rounded,
                warna: Colors.pink,
                cible: "/"),
          ]),
        ));
  }
}
