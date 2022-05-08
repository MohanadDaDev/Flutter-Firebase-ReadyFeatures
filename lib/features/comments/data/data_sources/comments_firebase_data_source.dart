import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_failure.dart';
import '../../../../core/success/opretion_success.dart';
import '../../../../core/success/success.dart';
import '../models/comment.dart';
import 'comments_cloud_data_source.dart';

class CommentsFirebaseDataSource extends CommentsCloudDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, Success>> addComment(
      {required Comment comment}) async {
    try {
      await firestore
          .collection(commentsRef)
          .doc(comment.id)
          .set(comment.toMap());
      return Right(OprationSeccuss());
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteComment(
      {required String commentId}) async {
    try {
      await firestore.collection(commentsRef).doc(commentId).delete();
      return Right(OprationSeccuss());
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Comment>> getComment(
      {required String commentId}) async {
    try {
      final DocumentSnapshot doc =
          await firestore.collection(commentsRef).doc(commentId).get();

      return Right(Comment.fromMap(doc.data() as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments(
      {required String objId}) async {
    try {
      final QuerySnapshot query = await firestore
          .collection(commentsRef)
          .where(CommentFields.commentedObjId, isEqualTo: objId)
          .get();

      return Right(
        query.docs
            .map((doc) => Comment.fromMap(doc.data() as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> updateComment(
      {required Comment comment}) async {
    try {
      await firestore
          .collection(commentsRef)
          .doc(comment.id)
          .update(comment.toMap());

      return Right(OprationSeccuss());
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }
}
