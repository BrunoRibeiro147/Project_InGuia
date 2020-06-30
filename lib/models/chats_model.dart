class ChatsModel {
  String name;
  String image;
  String lastMessage;
  bool haveunreadMessages;
  int unreadMessages;

  ChatsModel(this.name, this.image, this.lastMessage, this.haveunreadMessages,
      this.unreadMessages);
}

List<ChatsModel> chats = chatData
    .map((chat) => ChatsModel(chat['name'], chat['image'], chat['lastMessage'],
        chat['haveunreadMessages'], chat['unreadMessages']))
    .toList();

var chatData = [
  {
    "name": "Eduardo da Cruz",
    "image": "images/guides/man1.jpg",
    "lastMessage": "Olá Tudo Bem? E aí, preparado pra Aventura?",
    "haveunreadMessages": true,
    "unreadMessages": 1
  },
  {
    "name": "Maria das Graças",
    "image": "images/guides/woman2.jpg",
    "lastMessage": "Bom Dia! Como vai? Então, vamos organizar nosso tour?",
    "haveunreadMessages": false,
    "unreadMessages": 0
  },
];
