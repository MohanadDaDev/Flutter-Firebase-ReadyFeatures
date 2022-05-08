import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/success/success.dart';
import '../datasources/reviews_cloud_data_source.dart';
import '../models/review.dart';
import 'reviews_repo.dart';

class ReviewsRepositoryImpl extends ReviewsRepository {
  final ReviewsCloudDataSource cloudDataSource;

  ReviewsRepositoryImpl({required this.cloudDataSource});

  @override
  Future<Either<Failure, Success>> addReview({required Review review}) {
    return cloudDataSource.addReview(review: review);
  }

  @override
  Future<Either<Failure, Review>> getReview({required String reviewId}) {
    return cloudDataSource.getReview(reviewId: reviewId);
  }

  @override
  Future<Either<Failure, List<Review>>> getReviews({required String objId}) {
    return cloudDataSource.getReviews(objId: objId);
  }

  @override
  Future<Either<Failure, Success>> updateReview({required Review review}) {
    return cloudDataSource.updateReview(review: review);
  }

  @override
  Future<Either<Failure, Success>> deleteReview({required String reviewId}) {
    return cloudDataSource.deleteReview(reviewId: reviewId);
  }
}
