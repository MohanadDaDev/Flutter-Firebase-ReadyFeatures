import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_failure.dart';
import '../../../../core/success/opretion_success.dart';
import '../../../../core/success/success.dart';
import '../models/review.dart';
import 'reviews_cloud_data_source.dart';

class ReviewsFirebaseDataSource extends ReviewsCloudDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, Success>> addReview({required Review review}) async {
    try {
      await firestore.collection(reviewsRef).doc(review.id).set(review.toMap());
      return Right(OprationSeccuss());
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteReview(
      {required String reviewId}) async {
    try {
      await firestore.collection(reviewsRef).doc(reviewId).delete();
      return Right(OprationSeccuss());
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Review>> getReview({required String reviewId}) async {
    try {
      final DocumentSnapshot doc =
          await firestore.collection(reviewsRef).doc(reviewId).get();

      return Right(Review.fromMap(doc.data() as Map<String, dynamic>));
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Review>>> getReviews({
    required String objId,
  }) async {
    try {
      final QuerySnapshot query = await firestore
          .collection(reviewsRef)
          .where(ReviewFields.reviewedObjId, isEqualTo: objId)
          .get();

      return Right(
        query.docs
            .map((doc) => Review.fromMap(doc.data() as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Success>> updateReview({
    required Review review,
  }) async {
    try {
      await firestore
          .collection(reviewsRef)
          .doc(review.id)
          .update(review.toMap());

      return Right(OprationSeccuss());
    } catch (e) {
      return Left(ServerFailure(errorMassage: e.toString()));
    }
  }
}
