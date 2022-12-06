import 'package:flutter/material.dart';

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.warna, this.cible});
  final title;
  final icon;
  final warna;
  final cible;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(cible);
            },
            splashColor: Colors.green,
            child: Center(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(title, style: new TextStyle(fontSize: 17.0))
            ]))));
  }
}
