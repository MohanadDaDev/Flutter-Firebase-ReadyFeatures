import 'dart:convert';

import '../../../users/data/models/suser_data.dart';

class Review {
  final String reviewedObjId;
  final int value;
  final SUserData user;
  final int createdTimestamp;
  final String text;
  final String reviewedObjCollectionRef;

  Review({
    required this.reviewedObjId,
    required this.value,
    required this.user,
    required this.createdTimestamp,
    required this.text,
    required this.reviewedObjCollectionRef,
  });

  String get id => '${user.uid}-$reviewedObjId';
  String get reviewedObjPath => '$reviewedObjCollectionRef/$id';

  Review copyWith({
    String? reviewedObjId,
    int? value,
    SUserData? user,
    int? createdTimestamp,
    String? text,
    String? reviewedObjCollectionRef,
  }) {
    return Review(
      reviewedObjId: reviewedObjId ?? this.reviewedObjId,
      value: value ?? this.value,
      user: user ?? this.user,
      createdTimestamp: createdTimestamp ?? this.createdTimestamp,
      text: text ?? this.text,
      reviewedObjCollectionRef: reviewedObjCollectionRef ?? this.reviewedObjCollectionRef,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ReviewFields.id :id,
      ReviewFields.user:user,
      ReviewFields.value:value,
      ReviewFields.text: text,
      ReviewFields.reviewedObjId:reviewedObjId,
      ReviewFields.reviewedObjCollectionRef:reviewedObjCollectionRef,
      ReviewFields.reviewedObjPath:reviewedObjPath,
      ReviewFields.createdTimestamp:createdTimestamp,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      reviewedObjId: map['reviewedObjId'] ?? '',
      value: map['value']?.toInt() ?? 0,
      user: SUserData.fromMap(map['user']),
      createdTimestamp: map['createdTimestamp']?.toInt() ?? 0,
      text: map['text'] ?? '',
      reviewedObjCollectionRef: map['reviewedObjCollectionRef'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Review.fromJson(String source) => Review.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Review(reviewedObjId: $reviewedObjId, value: $value, user: $user, createdTimestamp: $createdTimestamp, text: $text, reviewedObjCollectionRef: $reviewedObjCollectionRef)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Review &&
      other.reviewedObjId == reviewedObjId &&
      other.value == value &&
      other.user == user &&
      other.createdTimestamp == createdTimestamp &&
      other.text == text &&
      other.reviewedObjCollectionRef == reviewedObjCollectionRef;
  }

  @override
  int get hashCode {
    return reviewedObjId.hashCode ^
      value.hashCode ^
      user.hashCode ^
      createdTimestamp.hashCode ^
      text.hashCode ^
      reviewedObjCollectionRef.hashCode;
  }
}

class ReviewFields {
  static String id = 'id';
  static String user = 'user';
  static String reviewedObjId = 'reviewedObjId';
  static String value = 'value';
  static String createdTimestamp = 'createdTimestamp';
  static String text = 'text';
  static String reviewedObjCollectionRef = 'reviewedObjCollectionRef';
  static String reviewedObjPath = 'reviewedObjPath';
}
