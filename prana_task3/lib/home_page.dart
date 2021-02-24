import 'package:flutter/material.dart';
import 'area_volume.dart';
import 'conversion_unit.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  final String nama;
  final String password;

  HomePage({Key key, @required this.nama, @required this.password}) : super(key:  key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page Task 3'),
        backgroundColor: Colors.orange[200],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _drawerHeader(widget.nama, widget.password),
            _drawerItem(
              icon: Icons.calculate,
              text: 'Area and Volume',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AreaVolume()));
              }
            ),
            _drawerItem(
              icon: Icons.swap_horizontal_circle,
              text: 'Unit Length',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ConversionUnit()));
              }
            ),
            Divider(
              height: 50.0,
              thickness: 1.0,
            ),
            _drawerItem(
              icon: Icons.logout,
              text: 'LOG OUT',
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              }
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange[100], Colors.blueAccent]
          )
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Welcome - ${widget.nama}',
                style: TextStyle(fontSize: 28.0, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Ini adalah Halaman Home Page Task 3, silahkan memilih menu perhitungan fisika dan konversi satuan panjang pada drawer disebelah kanan.',
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}

Widget _drawerHeader(name, pwd) {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(
        image: AssetImage('images/boy.png'),
        fit: BoxFit.cover,
      ),
    ),
    accountName: Text(name), 
    accountEmail: Text(pwd+'@gmail.com'),
    decoration: BoxDecoration(
      color: Colors.orange[200],
    ),
  );
}

Widget _drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}