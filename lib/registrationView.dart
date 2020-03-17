import 'package:flutter/material.dart';
import 'package:krepm_new/homeView.dart';
import 'package:krepm_new/loginView.dart';
import 'customWidgets/logoWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/profile.dart';

class RegistrationView extends StatefulWidget {
  RegistrationView({Key key}) : super(key: key);

  @override
  _RegistrationViewState createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
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
                          child: Form(
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
                                    controller: nameController,
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
                                      labelText: 'Имя',
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
                                    controller: surnameController,
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
                                      labelText: 'Фамилия',
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
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
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
                                      labelText: 'Телефон',
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
                                    child: Builder(
                                      builder: (context) => RaisedButton(
                                        onPressed: () {
                                          _submit(context);
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.0),
                                            side: BorderSide(
                                                color: Color.fromRGBO(
                                                    67, 38, 25, 1))),
                                        color: Color.fromRGBO(249, 241, 10, .9),
                                        child: Text('Зарегистрироваться',
                                            style: TextStyle(
                                              color:
                                                  Color.fromRGBO(248, 7, 7, .9),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ),
                                    )),
                              ),
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
                                                      LoginView()));
                                        },
                                        child: Text(
                                          "Войти",
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
                          ]))))),
            ))
      ],
    );
  }

  bool _validate() {
    bool valid = true;

    [
      nameController.text,
      surnameController.text,
      phoneController.text,
      emailController.text,
      passwdController.text
    ].forEach((element) {
      element.isEmpty ? valid = false : null;
    });

    return valid;
  }

  Future _submit(BuildContext context) async {
    if (_validate()) {
      var url = 'http://krepm.mrsu.ru/api/customer';
      var response = await http.post(url, body: {
        'name': nameController.text,
        'surname': surnameController.text,
        'patronymic': "",
        'phone': phoneController.text,
        'email': emailController.text,
        'passwd': passwdController.text,
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        var profile = Profile.fromJson(json.decode(response.body));
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
