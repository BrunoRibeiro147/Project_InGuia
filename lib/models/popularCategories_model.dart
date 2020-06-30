class PopularCategoriesModel {
  String category;
  String image;

  PopularCategoriesModel(this.category, this.image);
}

List<PopularCategoriesModel> categories = categoriesData
    .map((item) => PopularCategoriesModel(item['category'], item['image']))
    .toList();

var categoriesData = [
  {"category": 'Aventura', "image": "images/categories/adventure.jpg"},
  {"category": 'Ecológico', "image": "images/categories/ecologic.jpg"},
  {"category": 'Cultural', "image": "images/categories/culture.jpg"},
  {"category": 'Social', "image": "images/categories/social.jpg"},
  {"category": 'Negócios', "image": "images/categories/business.jpg"},
];
