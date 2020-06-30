import 'package:flutter/material.dart';
import 'package:inguia/Pages/Chat/chat_page.dart';
import 'package:inguia/Pages/Guides/guides_page.dart';
import 'package:inguia/Pages/Home/home_page.dart';
import 'package:inguia/Pages/Maps/maps_page.dart';
import 'package:inguia/Pages/Profile/profile_page.dart';
import 'package:inguia/Widgets/custom_bottomNavigation.dart';

class ControlPage extends StatefulWidget {
  ControlPage({Key key}) : super(key: key);

  @override
  _ControlPageState createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final _controller = PageController(
    initialPage: 2,
  );

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
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          ChatPage(),
          GuidesPage(),
          HomePage(),
          MapsPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        callback: (index) {
          setState(() {
            _controller.jumpToPage(index);
          });
        },
      ),
    );
  }
}
