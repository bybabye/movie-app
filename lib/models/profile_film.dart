class Profilefilm {
  final String name;
  final String description;
  final List<String> titles;
  final String film;
  final String image;

  Profilefilm({
    required this.name,
    required this.description,
    required this.titles,
    required this.film,
    required this.image,
  });

  factory Profilefilm.fromJson(Map<String, dynamic> json) {
    return Profilefilm(
      name: json['name'],
      description: json['description'],
      titles: List.from(json['titles']),
      film: json['film'],
      image: json['image'] ?? "",
    );
  }
}
