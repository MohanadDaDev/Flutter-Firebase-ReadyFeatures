import '../data_sources/comments_cloud_data_source.dart';
import '../models/comment.dart';
import '../../../../core/success/success.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'comments_repo.dart';

class CommentsRepositoryImpl extends CommentsRepository {
  final CommentsCloudDataSource cloudDataSource;

  CommentsRepositoryImpl({required this.cloudDataSource});

  @override
  Future<Either<Failure, Success>> addComment({required Comment comment}) {
    return cloudDataSource.addComment(comment: comment);
  }

  @override
  Future<Either<Failure, Success>> deleteComment({required String commentId}) {
    return cloudDataSource.deleteComment(commentId: commentId);
  }

  @override
  Future<Either<Failure, Comment>> getComment({required String commentId}) {
    return cloudDataSource.getComment(commentId: commentId);
  }

  @override
  Future<Either<Failure, List<Comment>>> getComments({required String objId}) {
    return cloudDataSource.getComments(objId: objId);
  }

  @override
  Future<Either<Failure, Success>> updateComment({required Comment comment}) {
    return cloudDataSource.updateComment(comment: comment);
  }
}
