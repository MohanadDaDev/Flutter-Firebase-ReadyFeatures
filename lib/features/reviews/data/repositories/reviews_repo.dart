


import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/success/success.dart';
import '../models/review.dart';

abstract class ReviewsRepository{
  Future<Either<Failure, List<Review>>> getReviews({
    required String objId,
  });
  Future<Either<Failure, Review>> getReview({required String reviewId});
  Future<Either<Failure, Success>> addReview({required Review review});
  Future<Either<Failure, Success>> updateReview({required Review review});
  Future<Either<Failure, Success>> deleteReview({required String reviewId});
}