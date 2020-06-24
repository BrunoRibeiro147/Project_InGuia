import 'package:flutter/material.dart';
import 'package:inguia/Pages/Register/register_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/background_spashScreen.jpg',
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 250),
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.height * 0.75,
              child: Image.asset(
                'images/logo.png',
                fit: BoxFit.contain,
              ),
            )
          ],
        )
      ],
    );
  }
}
