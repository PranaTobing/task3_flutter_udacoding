import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController unameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String uname, pass;

  GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: Colors.lime[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  child: Image.asset('images/udacodinglogo.png')
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0, bottom: 0),
              child: TextFormField(
                controller: unameController,
                decoration: InputDecoration(
                  hintText: 'User Name',
                  hintStyle: TextStyle(color: Colors.blueAccent),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  fillColor: Colors.blueAccent,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.person, color: Colors.blueAccent,),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0, bottom: 20.0),
              child: TextFormField(
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.blueAccent),
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  fillColor: Colors.blueAccent,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                      width: 2.0,
                    ),
                  ),
                  prefixIcon: Icon(Icons.lock,color: Colors.blueAccent,),
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
                  uname= unameController.text;
                  pass= passController.text;
                  if(uname == ''){
                    _formKey.currentState.showSnackBar(SnackBar(
                      content: Text('User Name is mandatory!'),
                      action: SnackBarAction(label: 'Close', onPressed: (){}),
                      )
                    );
                  } else if(uname != 'udacodingid'){
                    _formKey.currentState.showSnackBar(SnackBar(
                      content: Text('User Name is not Registered!'),
                      action: SnackBarAction(label: 'Close', onPressed: (){}),
                      )
                    );
                  } else if(pass == ''){
                    _formKey.currentState.showSnackBar(SnackBar(
                      content: Text('Password is mandatory!'),
                      action: SnackBarAction(label: 'Close', onPressed: (){}),
                      )
                    );
                  } else if(pass.length < 6){
                    _formKey.currentState.showSnackBar(SnackBar(
                      content: Text('Password should be minimum 6 characters!'),
                      action: SnackBarAction(label: 'Close', onPressed: (){}),
                      )
                    );
                  } else if(pass != 'udacodingJaya2021'){
                    _formKey.currentState.showSnackBar(SnackBar(
                      content: Text('Wrong Password!'),
                      action: SnackBarAction(label: 'Close', onPressed: (){}),
                      )
                    );
                  } else {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          nama: uname,
                          password: pass,
                        ),
                      )
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}