import 'package:flutter/material.dart';
import 'package:powers/powers.dart';

class ConversionUnit extends StatefulWidget {
  @override
  _ConversionUnitState createState() => _ConversionUnitState();
}

class _ConversionUnitState extends State<ConversionUnit> {
  int _valfrom = 1;
  int _valto = 4;
  double _result = 0;

  List _listFromUnit = [
    {'value': 1, 'name': 'Kilometer', 'unit': 'km'},
    {'value': 2, 'name': 'Hektometer', 'unit': 'hm'},
    {'value': 3, 'name': 'Dekameter', 'unit': 'dam'},
    {'value': 4, 'name': 'Meter', 'unit': 'm'},
    {'value': 5, 'name': 'Desimeter', 'unit': 'dm'},
    {'value': 6, 'name': 'Centimeter', 'unit': 'cm'},
    {'value': 7, 'name': 'Milimeter', 'unit': 'mm'},
  ];

  GlobalKey<ScaffoldState> _thKey = GlobalKey<ScaffoldState>();

  TextEditingController fromController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _thKey,
      appBar: AppBar(
        title: Text('Converter Length Unit'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: fromController,
              decoration: InputDecoration(
                hintText: 'Input',
                labelText: 'Input',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'From',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: DropdownButton(
                    value: _valfrom,
                    items: _listFromUnit.map((f) {
                      return DropdownMenuItem(
                        child: Text('${f['name']} (${f['unit']})'),
                        // child: Text(f['unit']),
                        value: f['value'],
                      );
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        _valfrom = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'To',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: DropdownButton(
                    value: _valto,
                    items: _listFromUnit.map((f) {
                      return DropdownMenuItem(
                        child: Text('${f['name']} (${f['unit']})'),
                        // child: Text(f['unit']),
                        value: f['value'],
                      );
                    }).toList(),
                    onChanged: (value){
                      setState(() {
                        _valto = value;
                      });
                    },
                  ),
                ),
              ],
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
                if(fromController.text.length > 0){
                  var pengali = (_valfrom - _valto) * -1;
                  var vpow = 10.pow(pengali);
                  setState(() {
                    _result = double.parse(fromController.text) * vpow;
                  });
                } else {
                  _thKey.currentState.showSnackBar(SnackBar(
                    content: Text('Please input number!'),
                    action: SnackBarAction(label: 'Close', onPressed: (){}),
                    )
                  );
                  setState(() {
                    _result = 0;
                  });
                }
                
              }
            )
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 8.0),
            child: TextFormField(
              enabled: false,
              controller: TextEditingController(text: _result.toString()),
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