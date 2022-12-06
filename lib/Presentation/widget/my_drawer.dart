import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: const <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text("Ghazi Kriaa",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
        accountEmail: Text("kriaaghazi73@gmail.com"),
        currentAccountPicture:
            CircleAvatar(backgroundImage: NetworkImage("https://scontent.ftun8-1.fna.fbcdn.net/v/t1.6435-9/122229216_3142619875964449_2997844986308691496_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=dfcf9ofslgYAX-m5Qtc&_nc_ht=scontent.ftun8-1.fna&oh=00_AfAgkGJPjw83kA0hJE3kgyEzgjKFA-0rzL3KYeEz0PZapg&oe=63B43BF7")),
        decoration: BoxDecoration(color: Colors.teal),
      ),
      ListTile(
          leading: Icon(
            Icons.person,
            color: Colors.teal,
          ),
          title: Text('Profil')),
      ListTile(
          leading: Icon(
            Icons.vpn_key,
            color: Colors.teal,
          ),
          title: Text('Password')),
      ListTile(
          leading: Icon(
            Icons.info,
            color: Colors.teal,
          ),
          title: Text('Info')),
      ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.teal,
          ),
          title: Text('Exit')),
    ]));
  }
}
