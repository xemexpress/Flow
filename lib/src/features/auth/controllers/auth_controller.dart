import 'package:appwrite/models.dart';
import 'package:flow/src/apis/apis.dart';
import 'package:flow/src/core/core.dart';
import 'package:flow/src/features/auth/view/log_in_screen.dart';
import 'package:flow/src/features/home/view/home_screen.dart';
import 'package:flow/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;

  AuthController({
    required AuthAPI authAPI,
    required UserAPI userAPI,
  })  : _authAPI = authAPI,
        _userAPI = userAPI,
        super(false);

  Future<User?> currentUser() => _authAPI.currentUserAccount();

  void superSignIn({
    required String email,
    required String password,
    required context,
  }) async {
    state = true;

    final alreadyExists =
        await _userAPI.userWithEmailAlreadyExists(email: email);

    if (alreadyExists) {
      final res = await _authAPI.logIn(
        email: email,
        password: password,
      );
      state = false;

      res.fold(
        (l) => showSnackBar(
          context: context,
          message: l.message,
        ),
        (r) {
          showSnackBar(
            context: context,
            message: 'Login Success.',
          );

          Navigator.of(context).pushReplacement(HomeScreen.route());
        },
      );
    } else {
      final res = await _authAPI.signUp(
        email: email,
        password: password,
      );
      state = false;

      res.fold(
        (l) => showSnackBar(context: context, message: l.message),
        (user) async {
          UserModel userModel = UserModel(
            uid: user.$id,
            email: email,
            username: getUsernameFromEmail(email),
            profilePic: '',
            nickname: '',
            spirituallyEnergies: '',
            speciality: '',
            favoriteCompany: '',
            mostUpsetMe: '',
            remarks: '',
          );

          final res = await _userAPI.saveUserData(userModel);

          res.fold(
            (l) => showSnackBar(context: context, message: l.message),
            (r) {
              showSnackBar(context: context, message: 'Account created!');
              Navigator.of(context).pushReplacement(HomeScreen.route());
            },
          );
        },
      );
    }
  }

  void signOut({
    required BuildContext context,
  }) async {
    state = true;

    final res = await _authAPI.signOut();

    state = false;

    res.fold(
      (l) {
        showSnackBar(
          context: context,
          message: l.message,
        );
      },
      (r) {
        showSnackBar(
          context: context,
          message: 'Logged out.',
        );

        Navigator.of(context).pushReplacement(
          LogInScreen.route(),
        );
      },
    );
  }

  Future<UserModel?> getUserData(String? uid) async {
    if (uid == null) {
      return null;
    }

    final document = await _userAPI.getUserData(uid);

    final user = UserModel.fromMap(document.data);

    return user;
  }
}
