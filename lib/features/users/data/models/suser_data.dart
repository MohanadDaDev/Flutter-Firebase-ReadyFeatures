import 'dart:convert';

import '/features/users/data/models/app_user.dart';

class SUserData {
  final String uid;
  final String name;
  final String? imageUrl;

  SUserData({
    required this.uid,
    required this.name,
    this.imageUrl,
  });

  factory SUserData.fromAppUser({required AppUser appUser}) {
    return SUserData(
      uid: appUser.uid,
      name: appUser.username,
      imageUrl: appUser.avatarImage,
    );
  }

  SUserData copyWith({
    String? uid,
    String? name,
    String? imageUrl,
  }) {
    return SUserData(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'name': name});
    result.addAll({'imageUrl': imageUrl});

    return result;
  }

  factory SUserData.fromMap(Map<String, dynamic> map) {
    return SUserData(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SUserData.fromJson(String source) =>
      SUserData.fromMap(json.decode(source));

  @override
  String toString() => 'SUserData(uid: $uid, name: $name, imageUrl: $imageUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SUserData &&
        other.uid == uid &&
        other.name == name &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => uid.hashCode ^ name.hashCode ^ imageUrl.hashCode;
}
