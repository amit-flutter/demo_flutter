class Comment {
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  Comment.fromJson(dynamic json) {
    postId = json['postId'] ?? 0;
    id = json['id'] ?? 0;
    name = json['name'] ?? "No Name";
    email = json['email'] ?? "No Email";
    body = json['body'] ?? "No Body";
  }
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['postId'] = postId;
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['body'] = body;
    return map;
  }
}
