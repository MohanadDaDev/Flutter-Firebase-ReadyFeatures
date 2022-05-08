

import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

import '../../../../core/success/success.dart';
import '../models/comment.dart';

abstract class CommentsRepository{
  Future<Either<Failure, List<Comment>>> getComments({
    required String objId,
  });
  Future<Either<Failure, Comment>> getComment({required String commentId});
  Future<Either<Failure, Success>> addComment({required Comment comment});
  Future<Either<Failure, Success>> updateComment({required Comment comment});
  Future<Either<Failure, Success>> deleteComment({required String commentId});
}