import 'package:flutter/material.dart';

class AreaVolume extends StatefulWidget {
  @override
  _AreaVolumeState createState() => _AreaVolumeState();
}

class _AreaVolumeState extends State<AreaVolume> {
  String _valHitung;
  double _res = 0;
  bool _visible = false;
  List _listHitung = ["Area", "Volume"];

  GlobalKey<ScaffoldState> _frmKey = GlobalKey<ScaffoldState>();

  TextEditingController pjgController = TextEditingController();
  TextEditingController lbrController = TextEditingController();
  TextEditingController tngController = TextEditingController();

  void _show(bool a){
    setState(() {
      _visible = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _frmKey,
      appBar: AppBar(
        title: Text('Area and Volume'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 8.0),
            child: DropdownButtonFormField(
              hint: Text('Select calculation method'),
              value: _valHitung,
              items: _listHitung.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _valHitung = value;
                  _res = 0;
                });
                if (value == 'Area') {
                  _show(false);
                } else if (value == 'Volume') {
                  _show(true);
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: pjgController,
              decoration: InputDecoration(
                hintText: 'Length',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: lbrController,
              decoration: InputDecoration(
                hintText: 'Width',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 8.0),
            child: Visibility(
              visible: _visible,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: tngController,
                decoration: InputDecoration(
                  hintText: 'Height',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            child: RaisedButton(
              color: Colors.blue[900],
              splashColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              padding: EdgeInsets.symmetric(vertical:15.0, horizontal:50.0),
              textColor: Colors.white,
              child: Text(
                "LOG IN",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
              ),
              onPressed: (){
                setState(() {
                  if(_valHitung == 'Area'){
                    _res = double.parse(pjgController.text) * double.parse(lbrController.text);
                  } else {
                    _res = double.parse(pjgController.text) * double.parse(lbrController.text) * double.parse(tngController.text);
                  }
                });
              }
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 8.0),
            child: TextFormField(
              enabled: false,
              controller: TextEditingController(text: _res.toString()),
              decoration: InputDecoration(
                hintText: 'Result',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}