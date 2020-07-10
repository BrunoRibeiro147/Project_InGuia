import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:inguia/models/guides_model.dart';
import 'package:inguia/models/popularCategories_model.dart';
import 'package:inguia/models/tours_model.dart';

class DetailsGuide extends StatelessWidget {
  final GuidesModel guide;
  final String tag;

  DetailsGuide({@required this.tag, @required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guia'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          tooltip: 'Voltar',
        ),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Hero(
                    tag: tag,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(guide.image), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 21,
              ),
              ListTile(
                title: Center(
                  child: Text(
                    guide.name,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Column(
                  children: <Widget>[
                    Text(
                      'Credencial: XXX.XXX.XXX.XXX-XX',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Avaliações:'),
                        RatingBarIndicator(
                          rating: guide.rating,
                          direction: Axis.horizontal,
                          itemSize: 30,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(vertical: 8),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Idiomas: ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Text(
                      guide.languages.join(', '),
                      style: TextStyle(
                          color: Theme.of(context).buttonColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 21),
                      child: Text(
                        'Habilidades:',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 140,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 16, right: 25),
                        itemCount: 2,
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
                                border: Border.all(
                                    color: Colors.grey[200], width: 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                ),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Text(
                                        categories[index].category,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .primaryColorDark,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 21),
                      child: Text(
                        'Pacotes Oferecidos:',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      height: 180,
                      child: ListView.builder(
                        padding: EdgeInsets.only(left: 16),
                        itemCount: 3,
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
                                            image:
                                                AssetImage(tours[index].image),
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
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 21),
                      child: Text(
                        'Serviços Oferecidos:',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 40,
                          columns: [
                            DataColumn(
                                label: Text(
                              'Serviço',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )),
                            DataColumn(
                                label: Text(
                              'Trabalho em Português',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )),
                            DataColumn(
                                label: Text(
                              'Trabalho em outro Idioma.',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Container(
                                width: 150,
                                child: Text(
                                  'Diária Completa 8 Horas',
                                  style: TextStyle(fontSize: 12),
                                ),
                              )),
                              DataCell(Container(
                                  width: 80, child: Text('R\$200.00'))),
                              DataCell(Text('R\$250.00')),
                            ]),
                            DataRow(cells: [
                              DataCell(
                                Text(
                                  'Hora Extra',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              DataCell(Text('R\$40.00')),
                              DataCell(Text('R\$50.00')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text(
                                'Pernoite Hotel/Barco 8h',
                                style: TextStyle(fontSize: 12),
                              )),
                              DataCell(Text('R\$250.00')),
                              DataCell(Text('R\$300.00')),
                            ]),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 21),
                      child: ButtonTheme(
                        height: 70,
                        minWidth: 270,
                        child: RaisedButton(
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          color: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Contratar este Guia!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
