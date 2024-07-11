class Character {
  final int id;
  final String name;
  final String description;
  final String thumbnail;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? "No posee descripción",
      thumbnail: '${json['thumbnail']['path']}.${json['thumbnail']['extension']}',
    );
  }

  @override
  String toString() {
    return 'Character{id: $id, name: $name, description: $description, thumbnail: $thumbnail}';
  }
}