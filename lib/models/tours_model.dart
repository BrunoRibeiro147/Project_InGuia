class ToursModel {
  String name;
  String content;
  String image;

  ToursModel(this.name, this.content, this.image);
}

List<ToursModel> tours = toursData
    .map((item) => ToursModel(item['name'], item['content'], item['image']))
    .toList();

var toursData = [
  {
    "name": "Tour Presidente Figueredo",
    "content":
        "Desfrute de lazer nas cachoeiras, cavernas, grutas e corredeiras de Presidente Figueiredo – AM. Com conforto e segurança",
    "image": "images/tour/presidente_figueredo.jpg"
  },
  {
    "name": "MUSA - Jardim Botânico",
    "content":
        "Um museu vivo no coração da floresta O Museu da Amazônia – Musa é um museu vivo, instalado na Reserva Adolfo Ducke, uma área de floresta primária de 10.000 hectares localizada no norte de Manaus.",
    "image": "images/tour/musa.jpg"
  },
  {
    "name": "Tour Presidente Figueredo",
    "content":
        "Desfrute de lazer nas cachoeiras, cavernas, grutas e corredeiras de Presidente Figueiredo – AM. Com conforto e segurança",
    "image": "images/tour/presidente_figueredo.jpg"
  },
  {
    "name": "MUSA - Jardim Botânico",
    "content":
        "Um museu vivo no coração da floresta O Museu da Amazônia – Musa é um museu vivo, instalado na Reserva Adolfo Ducke, uma área de floresta primária de 10.000 hectares localizada no norte de Manaus.",
    "image": "images/tour/musa.jpg"
  },
  {
    "name": "Tour Presidente Figueredo",
    "content":
        "Desfrute de lazer nas cachoeiras, cavernas, grutas e corredeiras de Presidente Figueiredo – AM. Com conforto e segurança",
    "image": "images/tour/presidente_figueredo.jpg"
  },
  {
    "name": "MUSA - Jardim Botânico",
    "content":
        "Um museu vivo no coração da floresta O Museu da Amazônia – Musa é um museu vivo, instalado na Reserva Adolfo Ducke, uma área de floresta primária de 10.000 hectares localizada no norte de Manaus.",
    "image": "images/tour/musa.jpg"
  },
];
