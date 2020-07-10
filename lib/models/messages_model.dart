class MessagesModel {
  String message;
  bool isByMe;

  MessagesModel(this.message, this.isByMe);
}

List<MessagesModel> messages = messagesData
    .map((message) => MessagesModel(message['message'], message['isByMe']))
    .toList();

var messagesData = [
  {
    "message": "Olá Tudo Bem? E aí, preparado pra Aventura?",
    "isByMe": false,
  },
  {
    "message": "Tudo Ótimo, super animado, quando começamos?",
    "isByMe": true,
  }
];
