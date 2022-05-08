

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/success/success.dart';
import '../models/like.dart';

abstract class LikesCloudDataSource{
  Future<Either<Failure,Success>> addLike({
    required Like like,
  });

  Future<Either<Failure,Success>> deleteLike({
    required String uid,
    required String toUnlikeId,
  });

  Future<Either<Failure,bool>> isLiked({
    required String uid,
    required String toCheckId,
  });
}