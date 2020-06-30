import 'package:flutter/material.dart';

Widget searchCategories({icon, color}) {
  IconData icon;
  Color color;

  return RawMaterialButton(
    onPressed: () {},
    elevation: 2,
    fillColor: color,
    child: Icon(
      icon,
      size: 18,
    ),
    padding: EdgeInsets.all(12),
    shape: CircleBorder(),
  );
}

final List<Widget> categoriesList = [
  searchCategories(icon: Icons.home, color: Colors.white),
  searchCategories(icon: Icons.restaurant, color: Colors.green[400]),
  searchCategories(icon: Icons.local_mall, color: Colors.blue[400]),
  searchCategories(icon: Icons.place, color: Colors.red[400]),
  searchCategories(icon: Icons.local_drink, color: Colors.orange[400]),
];

class SearchBarMaps extends StatelessWidget {
  const SearchBarMaps({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: 120,
            child: Card(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Pesquisar...',
                          style: TextStyle(color: Colors.grey[350])),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey[350],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CategoryButton(
                          icon: Icons.home,
                          isDark: false,
                          color: Colors.white,
                        ),
                        CategoryButton(
                          icon: Icons.restaurant,
                          isDark: true,
                          color: Colors.green[300],
                        ),
                        CategoryButton(
                          icon: Icons.local_drink,
                          isDark: true,
                          color: Colors.blue[400],
                        ),
                        CategoryButton(
                            icon: Icons.local_mall,
                            isDark: true,
                            color: Colors.red[400]),
                        CategoryButton(
                            icon: Icons.place,
                            isDark: true,
                            color: Colors.deepPurple[400]),
                      ],
                    ),
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  CategoryButton({this.icon, this.color, this.isDark});

  final IconData icon;
  final bool isDark;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {},
      elevation: 1,
      fillColor: color,
      child: Icon(
        icon,
        size: 18,
        color: isDark ? Colors.white : Colors.black,
      ),
      padding: const EdgeInsets.all(12),
      shape: CircleBorder(),
    );
  }
}
