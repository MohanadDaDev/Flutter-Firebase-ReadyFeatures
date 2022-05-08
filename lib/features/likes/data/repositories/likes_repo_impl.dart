import '../../../../core/success/success.dart';

import '../../../../core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../datasource/could_data_source.dart';
import '../models/like.dart';
import 'likes_repo.dart';

class LikesRepositoryImpl extends LikesRepository {
  final LikesCloudDataSource cloudDataSource;

  LikesRepositoryImpl({required this.cloudDataSource});

  @override
  Future<Either<Failure, Success>> addLike({required Like like}) {
    return cloudDataSource.addLike(like: like);
  }

  @override
  Future<Either<Failure, Success>> deleteLike({
    required String uid,
    required String toUnlikeId,
  }) {
    return cloudDataSource.deleteLike(uid: uid, toUnlikeId: toUnlikeId);
  }

  @override
  Future<Either<Failure, bool>> isLiked({
    required String uid,
    required String toCheckId,
  }) {
    return cloudDataSource.isLiked(uid: uid, toCheckId: toCheckId);
  }
}
