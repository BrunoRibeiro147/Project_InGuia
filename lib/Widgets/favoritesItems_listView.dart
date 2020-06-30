import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class _ItemDescription extends StatelessWidget {
  _ItemDescription({
    Key key,
    this.title,
    this.subtitle,
    this.author,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 4,
                ),
              ),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 12,
                ),
              ),
              Text(
                'R\$: 120.00',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Criado Por: ',
                    style:
                        GoogleFonts.lato(fontSize: 12, color: Colors.grey[400]),
                  ),
                  TextSpan(
                    text: '$author',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FavouriteItemsListView extends StatelessWidget {
  FavouriteItemsListView({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.author,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width * 0.90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ItemDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
