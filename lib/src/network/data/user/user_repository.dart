import 'package:together/src/network/model/common/result.dart';
import 'package:together/src/network/model/user.dart';

abstract class UserRepository {
  Future<XResult<String>> signUpWithEmailPassword({
    required String email,
    required String password,
  });
  Future<XResult<WUser>> createNewAccount(WUser data);
}
