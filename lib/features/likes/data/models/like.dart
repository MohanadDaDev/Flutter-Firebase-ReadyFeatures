class Like {
  final String uid;
  final String likedObjId;
  final String likedObjCollectionRef;

  Like({
    required this.uid,
    required this.likedObjId,
    required this.likedObjCollectionRef,
  });

  String get id => '$uid-$likedObjId';
  String get likedObjPath => '$likedObjCollectionRef/$id';

  Map<String, dynamic> toMap() {
    return {
      LikeFields.uid: uid,
      LikeFields.likedObjId: likedObjId,
      LikeFields.likedObjCollectionRef:likedObjCollectionRef,
      LikeFields.likedObjPath: likedObjPath,
    };
  }

  // factory Like.fromMap(Map<String, dynamic> map) {
  //   return Like(
  //     uid: map.containsKey(LikeFields.uid)? map[LikeFields.uid] : '',
  //     likedObjId:  map['likedObjId'] ?? '',
  //     likedObjCollectionRef: map['likedObjCollectionRef'] ?? '',
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Like.fromJson(String source) => Like.fromMap(json.decode(source));
}

class LikeFields {
  static String id = 'id';
  static String uid = 'uid';
  static String likedObjId = 'likedObjId';
  static String likedObjCollectionRef = 'likedObjCollectionRef';
  static String likedObjPath = 'likedObjPath';
}
