import 'dart:convert';

import '../../../users/data/models/suser_data.dart';

class Comment {
  final String id;
  final String text;
  final SUserData user;
  final String commentedObjId;
  final int createdTimestamp;
  final String commentedObjPath;
  
  Comment({
    required this.id,
    required this.text,
    required this.user,
    required this.commentedObjId,
    required this.createdTimestamp,
    required this.commentedObjPath,
  });

  

  Comment copyWith({
    String? id,
    String? text,
    SUserData? user,
    String? commentedObjId,
    int? createdTimestamp,
    String? commentedObjPath,
  }) {
    return Comment(
      id: id ?? this.id,
      text: text ?? this.text,
      user: user ?? this.user,
      commentedObjId: commentedObjId ?? this.commentedObjId,
      createdTimestamp: createdTimestamp ?? this.createdTimestamp,
      commentedObjPath: commentedObjPath ?? this.commentedObjPath,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'text': text});
    result.addAll({'user': user.toMap()});
    result.addAll({'commentedObjId': commentedObjId});
    result.addAll({'createdTimestamp': createdTimestamp});
    result.addAll({'commentedObjPath': commentedObjPath});
  
    return result;
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      user: SUserData.fromMap(map['user']),
      commentedObjId: map['commentedObjId'] ?? '',
      createdTimestamp: map['createdTimestamp']?.toInt() ?? 0,
      commentedObjPath: map['commentedObjPath'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(id: $id, text: $text, user: $user, commentedObjId: $commentedObjId, createdTimestamp: $createdTimestamp, commentedObjPath: $commentedObjPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Comment &&
      other.id == id &&
      other.text == text &&
      other.user == user &&
      other.commentedObjId == commentedObjId &&
      other.createdTimestamp == createdTimestamp &&
      other.commentedObjPath == commentedObjPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      text.hashCode ^
      user.hashCode ^
      commentedObjId.hashCode ^
      createdTimestamp.hashCode ^
      commentedObjPath.hashCode;
  }
}
