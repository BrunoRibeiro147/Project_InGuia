import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inguia/Pages/splash_screen.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatefulWidget {
  AppWidget({Key key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
          primaryColor: Color(0xff5BC780),
          primaryColorLight: Color(0xff5BDE64),
          primaryColorDark: Color(0xff78D457),
          accentColor: Color(0xff5BDEAE),
          buttonColor: Color(0xff57D4C9)),
    );
  }
}
