import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;

  final String username;

  final String email;

  String? avatarImage;

  List<String> summariesToStudy;

  final int? lastChangeTimeStamp;

  AppUser({
    required this.uid,
    required this.username,
    required this.email,
    this.avatarImage,
    required this.summariesToStudy,
    this.lastChangeTimeStamp,
  });

  bool get hasPhoto => avatarImage != null;

  AppUser changeAvatarUrl(String? newAvatarUrl) {
    avatarImage = newAvatarUrl;
    return this;
  }

  bool addSummaryIdToSummariesToStudy({required String summaryId}) {
    if (summariesToStudy.contains(summaryId) == false) {
      summariesToStudy.add(summaryId);
      return true;
    } else {
      return false;
    }
  }

  bool deleteSummaryIdFromSummariesToStudy({required String summaryId}) {
    if (summariesToStudy.contains(summaryId) == true) {
      summariesToStudy.remove(summaryId);
      return true;
    } else {
      return false;
    }
  }

  

  factory AppUser.fromDocument(DocumentSnapshot doc) {
    return AppUser(
      uid: doc.get('uid'),
      username: doc.get('username'),
      email: doc.get('email'),
      summariesToStudy: List<String>.from(doc.get('summariesToStudy')),
      lastChangeTimeStamp: doc.get('lastChangeTimeStamp'),
      avatarImage: doc.get('avatarImage'),
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'uid': uid});
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'avatarImage': avatarImage});
    result.addAll({'summariesToStudy': summariesToStudy});
    result.addAll({'lastChangeTimeStamp': lastChangeTimeStamp});

    return result;
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      avatarImage: map['avatarImage'],
      summariesToStudy: List<String>.from(map['summariesToStudy']),
      lastChangeTimeStamp: map['lastChangeTimeStamp']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(uid: $uid, username: $username, email: $email, avatarImage: $avatarImage, summariesToStudy: $summariesToStudy, lastChangeTimeStamp: $lastChangeTimeStamp)';
  }

  AppUser copyWith({
    String? uid,
    String? username,
    String? email,
    String? avatarImage,
    List<String>? summariesToStudy,
    int? lastChangeTimeStamp,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      email: email ?? this.email,
      avatarImage: avatarImage ?? this.avatarImage,
      summariesToStudy: summariesToStudy ?? this.summariesToStudy,
      lastChangeTimeStamp: lastChangeTimeStamp ?? this.lastChangeTimeStamp,
    );
  }
}
