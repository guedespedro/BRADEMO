import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  Post copyWith({String? title, String? body}) {
    return Post(
      userId: this.userId,
      id: this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'] ?? 0,
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }
}