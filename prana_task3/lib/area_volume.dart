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
  String _satuan = 'm'+'\u00B2';

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
                  setState(() {
                    _satuan = 'm'+'\u00B2';
                  });
                } else if (value == 'Volume') {
                  _show(true);
                  setState(() {
                    _satuan = 'm'+'\u00B3';
                  });
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
                labelText: 'Length',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
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
                labelText: 'Width',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
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
                  labelText: 'Height',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
            child: RaisedButton(
              color: Colors.green,
              splashColor: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              padding: EdgeInsets.symmetric(vertical:15.0, horizontal:50.0),
              textColor: Colors.white,
              child: Text(
                "RESULT",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w900),
              ),
              onPressed: (){
                setState(() {
                  if(_valHitung == 'Area'){
                    _res = double.parse(pjgController.text) * double.parse(lbrController.text);
                    _satuan = 'm'+'\u00B2';
                  } else if (_valHitung == 'Volume'){
                    _res = double.parse(pjgController.text) * double.parse(lbrController.text) * double.parse(tngController.text);
                    _satuan = 'm''m'+'\u00B3';
                  } else {
                    _frmKey.currentState.showSnackBar(SnackBar(
                      content: Text('Please choose the method calculation!'),
                      action: SnackBarAction(label: 'Close', onPressed: (){}),
                      )
                    );
                  }
                });
              }
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 8.0),
            child: TextFormField(
              enabled: false,
              controller: TextEditingController(
                text: 
                  '${_res.toString()} $_satuan'
              ),
              decoration: InputDecoration(
                hintText: 'Result',
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                ),
                filled: true,
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