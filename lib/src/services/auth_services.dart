import 'package:firebase_auth/firebase_auth.dart';
import 'package:together/src/network/model/common/result.dart';
import 'package:together/src/utils/helper/logger.dart';

class AuthService {
  Future<XResult<UserCredential?>> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return XResult.success(userCredential);
    } on FirebaseAuthException catch (e, trace) {
      LoggerHelper.error(
          key: "AuthService - signUpWithEmailPassword",
          text: e.toString() + trace.toString());
      final messageError = _handleCreateUserError(e.code);
      return XResult.error(messageError);
    }
  }

  static String _handleCreateUserError(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return 'This email address is already in use.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled. Please enable them in the Firebase Console.';
      case 'weak-password':
        return 'The password is not strong enough.';
      default:
        return 'An error occurred. Please try again later.';
    }
  }
}
