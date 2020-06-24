import 'package:flutter/material.dart';
import 'package:inguia/Widgets/custom_bottomNavigation.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'images/logo.png',
          fit: BoxFit.cover,
          scale: 7.5,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
