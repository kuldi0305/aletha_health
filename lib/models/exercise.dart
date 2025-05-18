class Exercise {
  final String id;
  final String name;
  final String description;
  final int duration;
  final String difficulty;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.difficulty,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      duration: int.parse(json['duration'].toString()),
      difficulty: json['difficulty'],
    );
  }
}
