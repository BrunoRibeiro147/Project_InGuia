class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "images/background_spashScreen.jpg"},
  {"image": "images/ponta_negra.png"},
  {"image": "images/teatro_amazonas.jpeg"},
];
