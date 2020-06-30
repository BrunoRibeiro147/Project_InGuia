import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inguia/Pages/Register/register_page.dart';
import 'package:inguia/control_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _textField({String title, bool isPassword}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: title,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(42),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Bem-Vindo(a)',
                          style: TextStyle(fontSize: 32),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 21),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text:
                                TextSpan(style: GoogleFonts.lato(), children: [
                              TextSpan(
                                  text:
                                      'Encontre as Melhores Experiências com o ',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18)),
                              TextSpan(
                                  text: 'InGuia.',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ]),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              _textField(title: 'Email', isPassword: false),
                              _textField(title: 'Senha', isPassword: true),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Container(
                            width: 150,
                            height: 50,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ControlPage(),
                                  ),
                                );
                              },
                              color: Theme.of(context).buttonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Entrar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: RichText(
                            text:
                                TextSpan(style: GoogleFonts.lato(), children: [
                              TextSpan(
                                  text: 'Não Possui uma Conta? ',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: 'Cadastre-se Aqui.',
                                  style: TextStyle(
                                      color: Theme.of(context).buttonColor))
                            ]),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
