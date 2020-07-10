import 'package:flutter/material.dart';
import 'package:inguia/models/messages_model.dart';

class DetailChat extends StatefulWidget {
  DetailChat({Key key}) : super(key: key);

  @override
  _DetailChatState createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensagens'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          tooltip: 'Voltar',
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                "images/guides/man1.jpg",
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Eduardo da Cruz',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChattingTile(
                    message: messages[index].message,
                    isByMe: messages[index].isByMe,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Digite a sua Mensagem.',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.sentiment_satisfied),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChattingTile extends StatelessWidget {
  final bool isByMe;
  final String message;
  ChattingTile({@required this.isByMe, @required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      alignment: isByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: isByMe ? Theme.of(context).primaryColorLight : Colors.black26,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: isByMe ? Radius.circular(30) : Radius.circular(0),
            bottomRight: isByMe ? Radius.circular(0) : Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 2 / 3,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
