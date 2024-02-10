import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flow/src/constants/constants.dart';
import 'package:flow/src/core/core.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final userAPIProvider = Provider((ref) {
  final databases = ref.watch(appwriteDatabasesProvider);

  return UserAPI(db: databases);
});

abstract class IUserAPI {
  Future<bool> userWithEmailAlreadyExists({
    required String email,
  });

  FutureEitherVoid saveUserData(UserModel userModel);

  Future<Document> getUserData(String uid);
}

class UserAPI implements IUserAPI {
  final Databases _db;

  UserAPI({
    required Databases db,
  }) : _db = db;

  @override
  Future<bool> userWithEmailAlreadyExists({required String email}) async {
    try {
      final alreadyExists = (await _db.listDocuments(
            databaseId: AppwriteConstants.databaseId,
            collectionId: AppwriteConstants.usersCollectionId,
            queries: [Query.equal('email', email)],
          ))
              .total !=
          0;
      return alreadyExists;
    } on AppwriteException catch (e) {
      print('${e.code} ${e.type}');

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.usersCollectionId,
        documentId: userModel.uid,
        data: userModel.toMap(),
      );

      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          message: e.message ??
              "Some unexpected error occurred when saving user data",
          stackTrace: stackTrace,
        ),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Document> getUserData(String uid) async {
    return await _db.getDocument(
      databaseId: AppwriteConstants.databaseId,
      collectionId: AppwriteConstants.usersCollectionId,
      documentId: uid,
    );
    // return (await _db.listDocuments(
    //   databaseId: AppwriteConstants.databaseId,
    //   collectionId: AppwriteConstants.usersCollectionId,
    //   queries: [Query.equal('\$id', uid)],
    // ))
    //     .documents
    //     .first;
  }
}
