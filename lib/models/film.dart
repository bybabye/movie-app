class Film {
  final String image;
  final String imdb;
  final String url;

  Film({required this.image, required this.imdb, required this.url});

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(image: json['image'], imdb: json['imdb'], url: json['url']);
  }
}
