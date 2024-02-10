import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flow/src/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);

  return AuthAPI(account: account);
});

abstract class IAuthAPI {
  // FutureEither<String> startAuth({
  //   required String email,
  //   required String password,
  // });

  Future<User?> currentUserAccount();

  FutureEither<Session> logIn({
    required String email,
    required String password,
  });

  FutureEither<User> signUp({
    required String email,
    required String password,
  });

  FutureEitherVoid signOut();
}

class AuthAPI implements IAuthAPI {
  final Account _account;

  AuthAPI({
    required Account account,
  }) : _account = account;

  @override
  Future<User?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException catch (_) {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  FutureEither<Session> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final Session session = await _account.createEmailSession(
        email: email,
        password: password,
      );

      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          message:
              e.message ?? "Some unexpected error occurred when logging in.",
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
  FutureEither<User> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final User user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );

      return right(user);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          message:
              e.message ?? "Some unexpected error occurred when logging in.",
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
  FutureEitherVoid signOut() async {
    try {
      await _account.deleteSession(sessionId: 'current');

      return right(null);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(
          message:
              e.message ?? "Some unexpected error occurred when signing out.",
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
}
