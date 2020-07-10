import 'package:flutter/material.dart';
import 'package:inguia/Pages/Chat/detailChat_page.dart';
import 'package:inguia/models/chats_model.dart';
import 'package:inguia/models/guides_model.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Chats Disponíveis',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 120,
                child: ListView.builder(
                  itemCount: guides.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return StoryTile(
                      image: guides[index].image,
                      name: guides[index].name,
                    );
                  },
                ),
              ),

              //Chats

              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Recentes',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: chats.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ChatTile(
                          image: chats[index].image,
                          name: chats[index].name,
                          lastMessage: chats[index].lastMessage,
                          havereadMessages: chats[index].haveunreadMessages,
                          unreadMessages: chats[index].unreadMessages,
                        );
                      },
                    ),
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

class StoryTile extends StatelessWidget {
  final String image;
  final String name;

  StoryTile({@required this.image, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              image,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String image;
  final String name;
  final String lastMessage;
  final bool havereadMessages;
  final int unreadMessages;

  ChatTile(
      {@required this.image,
      @required this.name,
      @required this.lastMessage,
      @required this.havereadMessages,
      @required this.unreadMessages});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black38,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => DetailChat()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    image,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        lastMessage,
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      havereadMessages
                          ? Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.redAccent),
                              child: Text(
                                "$unreadMessages",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                )
              ],
            ),
            Divider(
              height: 42,
            ),
          ],
        ),
      ),
    );
  }
}
