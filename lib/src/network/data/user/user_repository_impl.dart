import 'package:together/src/network/data/user/user_repository.dart';
import 'package:together/src/network/firestore/reference/user_collection_reference.dart';
import 'package:together/src/network/model/common/result.dart';
import 'package:together/src/network/model/user.dart';

class UserRepositoryImpl extends UserRepository {
  final reference = UserCollectionReference();

  @override
  Future<XResult<String>> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return reference.signUpWithEmailPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<XResult<WUser>> createNewAccount(WUser data) {
    return reference.add(data);
  }
}
