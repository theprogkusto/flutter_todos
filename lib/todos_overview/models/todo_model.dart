class Todo {
  final String id;
  final String title;
  final String description;

  Todo({required this.id, this.title = '', this.description = ''});

  Todo copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}