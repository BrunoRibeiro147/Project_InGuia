import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inguia/Widgets/custom_ListView.dart';
import '../../constants/style_constants.dart';
import '../../models/carousel_model.dart';
import '../../models/popularCategories_model.dart';
import '../../models/tours_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 18, left: 16, bottom: 24),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Olá, ',
                    style:
                        GoogleFonts.lato(fontSize: 21, color: Colors.black87),
                  ),
                  TextSpan(
                    text: 'Bruno Ribeiro.',
                    style: GoogleFonts.lato(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: '\ngrandes aventuras lhe esperam aqui!',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ]),
              ),
            ),

            // Seção de Destaques

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                  carousels[index].image,
                                ),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(carousels, (index, image) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 6,
                            width: 6,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? Theme.of(context).primaryColorLight
                                    : Colors.grey),
                          );
                        }),
                      ),
                      Text(
                        'Mais...',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )
                    ],
                  )
                ],
              ),
            ),
            // Sessão de Categorias

            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                'Categorias Populares!',
                style: titleStyle,
              ),
            ),
            Container(
              height: 140,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16, right: 16),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[200], width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 74,
                              width: 74,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                      categories[index].image,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Text(
                                categories[index].category,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Sessão de Localidades

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Container(
                padding: EdgeInsets.only(top: 24),
                height: MediaQuery.of(context).size.height * 0.60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Text(
                        'Melhores Estabelecimentos de Manaus.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.all(10),
                        children: <Widget>[
                          CustomListItemTwo(
                            thumbnail:
                                Image.asset('images/places/restaurant.jpg'),
                            title: 'Jaraqui com Farinha é Bom!',
                            subtitle:
                                'Não achei foto de Jaraqui essa vai ter que ilustrar',
                            author: 'InGuia',
                          ),
                          CustomListItemTwo(
                            thumbnail: Image.asset('images/places/hotel.jpg'),
                            title: 'Hotel Centro!',
                            subtitle: 'Finja que tem uma Ótima Descrição!',
                            author: 'InGuia',
                          ),
                          CustomListItemTwo(
                            thumbnail:
                                Image.asset('images/places/business.jpg'),
                            title: 'Sidia!',
                            subtitle:
                                'Melhor empresa de tecnologia do Amazonas!',
                            author: 'Bruno Ribeiro',
                          ),
                          CustomListItemTwo(
                            thumbnail: Image.asset('images/places/burger.jpg'),
                            title: 'Burger King!',
                            subtitle: 'Está com Você aonde For!',
                            author: 'Bruno Ribeiro',
                          ),
                          CustomListItemTwo(
                            thumbnail:
                                Image.asset('images/places/hotel_tropical.jpg'),
                            title: 'Hotel Tropical!',
                            subtitle: 'Hotel de Luxo para quem Pode!',
                            author: 'Bruno Ribeiro',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Sessão de Pontos Turísticos

            Padding(
              padding: EdgeInsets.only(top: 24, bottom: 24),
              child: Center(
                child: Text(
                  'Passeios Turísticos em Manaus!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ),
            ),
            Container(
              height: 181,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16),
                itemCount: tours.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 220,
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(tours[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Text(
                                tours[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          tours[index].content,
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
