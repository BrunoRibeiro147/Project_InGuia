class GuidesModel {
  String name;
  String image;
  List<String> skills;
  List<String> languages;
  double rating;

  GuidesModel(this.name, this.image, this.skills, this.languages, this.rating);
}

List<GuidesModel> guides = guidesData
    .map(
      (guide) => GuidesModel(guide['name'], guide['image'], guide['skills'],
          guide['languages'], guide['rating']),
    )
    .toList();

var guidesData = [
  {
    "name": "Eduardo da Cruz",
    "image": "images/guides/man1.jpg",
    "skills": ["Aventura", 'História'],
    "languages": ["Inglês", "Francês"],
    "rating": 5.0
  },
  {
    "name": "Mayara Ferreira",
    "image": "images/guides/woman1.jpg",
    "skills": ["Aventura", 'História'],
    "languages": ["Inglês", "Alemão"],
    "rating": 4.0
  },
  {
    "name": "João da Silva",
    "image": "images/guides/man2.jpg",
    "skills": ["Aventura", 'História'],
    "languages": ["Inglês", "Japonês"],
    "rating": 4.0
  },
  {
    "name": "Maria das Graças",
    "image": "images/guides/woman2.jpg",
    "skills": ["Pesca", 'História'],
    "languages": ["Inglês", "Espanhol"],
    "rating": 3.0
  },
  {
    "name": "Isabele Gonçalves",
    "image": "images/guides/woman3.jpg",
    "skills": ["Aventura", 'Gastronômico'],
    "languages": ["Inglês", "Holândes"],
    "rating": 2.0
  },
];
