class Album {
  final String title;
  final int userId;
  final int id;

  const Album({required this.title, required this.userId, required this.id});

  factory Album.fromJson(Map<String, dynamic> json) =>
      Album(title: json['title'], userId: json['userId'], id: json['id']);
}
