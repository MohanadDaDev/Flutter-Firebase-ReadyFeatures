
//! Any Commentable object(class) should extend this class

/// This used for denormlizing data in the document
/// so when you need the number of comments you dont have to read
/// all the collction with same commnted object id 
/// 
/// This Feild will be changed in the server side whenever 
/// a new comment added and will target the commented object to do 
/// the changes via the path provided in the review documnet
abstract class Commentable {
  abstract int commentsNumber;
}
