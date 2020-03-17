import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:krepm_new/homeView.dart';
import 'package:krepm_new/registrationView.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'customWidgets/logoWidget.dart';
import 'models/profile.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/background_blur.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Container(
                      color: Colors.transparent,
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                            SizedBox(height: 10),
                            Center(
                              child: Container(
                                  width: width * 0.8, child: logoWidget()),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                                child: ListView(children: [
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Theme(
                                  data: new ThemeData(
                                    primaryColor:
                                        Color.fromRGBO(249, 241, 10, .4),
                                    hintColor: Color.fromRGBO(249, 241, 10, .4),
                                  ),
                                  child: TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    obscureText: false,
                                    maxLength: 50,
                                    style: TextStyle(
                                        color: Color.fromRGBO(249, 241, 10, .9),
                                        fontSize: 15),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      filled: true,
                                      fillColor: Color.fromRGBO(67, 38, 25, 1),
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  249, 241, 10, .4))),
                                      labelText: 'Email',
                                      counterText: "",
                                      labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(249, 241, 10, .4)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Theme(
                                  data: new ThemeData(
                                    primaryColor:
                                        Color.fromRGBO(249, 241, 10, .4),
                                    hintColor: Color.fromRGBO(249, 241, 10, .4),
                                  ),
                                  child: TextField(
                                    controller: passwdController,
                                    obscureText: true,
                                    maxLength: 50,
                                    style: TextStyle(
                                        color: Color.fromRGBO(249, 241, 10, .9),
                                        fontSize: 15),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      filled: true,
                                      fillColor: Color.fromRGBO(67, 38, 25, 1),
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  249, 241, 10, .4))),
                                      labelText: 'Пароль',
                                      counterText: "",
                                      labelStyle: TextStyle(
                                          color:
                                              Color.fromRGBO(249, 241, 10, .4)),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: ButtonTheme(
                                    minWidth: width,
                                    height: 50.0,
                                    child: RaisedButton(
                                      onPressed: () {_submit(context);},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0),
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  67, 38, 25, 1))),
                                      color: Color.fromRGBO(249, 241, 10, .9),
                                      child: Text('Войти',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(248, 7, 7, .9),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                  )),
                              SizedBox(height: 20),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Center(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegistrationView()));
                                        },
                                        child: Text(
                                          "Регистрация",
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                249, 241, 10, .9),
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  )),
                              SizedBox(height: 20),
                            ])),
                          ])))),
            ))
      ],
    );
  }

  Future _submit(BuildContext context) async {
    if (emailController.text.isNotEmpty && passwdController.text.isNotEmpty) {
      var url = 'http://krepm.mrsu.ru/api/customer/show';
      var response = await http.post(url, body: {
        'email': emailController.text,
        'passwd': passwdController.text,
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var profile = Profile.fromJson(json.decode(response.body));
        print("save");
        _saveProfile(profile);
      }
    } else {
      _showToast(context);
    }
  }

  void _saveProfile(Profile profile) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', profile.id);
    prefs.setString('name', profile.name);
    prefs.setString('phone', profile.phone);
    prefs.setString('sum', profile.sum);
    prefs.setString('nextSum', profile.nextSum);
    prefs.setString('percent', profile.percent);
    prefs.setString('card', profile.card);
    prefs.setString('email', profile.email);
    prefs.setString('passwd', passwdController.text);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeView()));
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: const Text('Все поля обязательны для заполнения!'),
      ),
    );
  }

}
