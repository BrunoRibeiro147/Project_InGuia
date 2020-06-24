import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({Key key}) : super(key: key);

  @override
  _CustomBottonNavigationState createState() => _CustomBottonNavigationState();
}

class _CustomBottonNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  var textStyle =
      GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w500);

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _bottomNavigationItem({icon, title, index}) {
    return BottomNavigationBarItem(
      icon: _selectedIndex == index
          ? Icon(
              icon,
              color: Theme.of(context).buttonColor,
            )
          : Icon(
              icon,
            ),
      title: Text(
        title,
        style: textStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _bottomNavigationItem(title: 'Chat', icon: Icons.message, index: 0),
          _bottomNavigationItem(title: 'Guias', icon: Icons.people, index: 1),
          _bottomNavigationItem(title: 'Home', icon: Icons.home, index: 2),
          _bottomNavigationItem(title: 'Mapas', icon: Icons.map, index: 3),
          _bottomNavigationItem(title: 'Perfil', icon: Icons.person, index: 4),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).buttonColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTap,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
