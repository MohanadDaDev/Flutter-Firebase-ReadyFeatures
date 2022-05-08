import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_failure.dart';
import '../../../../core/success/opretion_success.dart';
import '../../../../core/success/success.dart';

import '../../../../core/constants.dart';
import '../models/like.dart';
import 'could_data_source.dart';

class LikesFirebaseDataSource extends LikesCloudDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, Success>> deleteLike(
      {required String uid, required String toUnlikeId}) async {
    try {
      await firestore.collection(likesRef).doc('$uid-$toUnlikeId').delete();
      return Right(OprationSeccuss());
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isLiked(
      {required String uid, required String toCheckId}) async {
    try {
      final doc =
          await firestore.collection(likesRef).doc('$uid-$toCheckId').get();

      return Right(doc.exists);
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> addLike({required Like like}) async {
    try {
      await firestore.collection(likesRef).doc(like.id).set(like.toMap());
      return Right(OprationSeccuss());
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }
}
