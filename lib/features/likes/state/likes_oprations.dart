import 'dart:developer';

import '../data/models/like.dart';
import '../data/repositories/likes_repo.dart';

class LikesOprations {
  final LikesRepository repository;

  LikesOprations({required this.repository});

  Future<bool> addLike({
    required String objId,
    required String objRef,
  }) async {
    //here you get the user id
    const uid = 'uid';

    if (uid == null) {
      //TODO handle not sign in: like show dialog for sign or show snackbar etc
      return false;
    }

    final Like like =
        Like(uid: uid, likedObjId: objId, likedObjCollectionRef: objRef);
    final result = await repository.addLike(like: like);

    result.fold(
      (failure) {
        //TODO show error
        return false;
      },
      (success) {
        return true;
      },
    );
  }

  Future<bool> isLiked({required String objId}) async {
    final uid = authController.currUser?.uid;

    if (uid == null) {
      return false;
    }

    final result = await repository.isLiked(uid: uid, toCheckId: objId);

    result.fold(
      (failure) {
        //TODO show error
        return false;
      },
      (isLiked) {
        return isLiked;
      },
    );
  }

  Future<bool> deleteLike({required String objId}) async {
    final uid = authController.currUser?.uid;

    if (uid == null) {
      //show not sign
      return false;
    }

    final result = await repository.deleteLike(uid: uid, toUnlikeId: objId);

    result.fold(
      (failure) {
        //show error
        return false;
      },
      (success) {
        return true;
      },
    );
  }
}
