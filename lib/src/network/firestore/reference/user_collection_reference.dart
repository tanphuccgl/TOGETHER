import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:together/src/network/collection.dart';
import 'package:together/src/network/firestore/reference/base_collection_reference.dart';
import 'package:together/src/network/model/common/result.dart';
import 'package:together/src/network/model/user.dart';
import 'package:together/src/services/auth_services.dart';
import 'package:together/src/utils/helper/logger.dart';

class UserCollectionReference extends BaseCollectionReference<WUser> {
  UserCollectionReference()
      : super(FirebaseFirestore.instance
            .collection(XCollection.users)
            .withConverter<WUser>(
              fromFirestore: ((snapshot, _) {
                final value = snapshot.data() as Map<String, dynamic>;
                return WUser.fromMap(value);
              }),
              toFirestore: (model, _) => model.toMap(),
            ));

  Future<XResult<String>> signUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final authService = AuthService();
      final userCredential = await authService.signUpWithEmailPassword(
        email: email,
        password: password,
      );
      if (userCredential.isSuccess) {
        return XResult.success(userCredential.data!.user?.uid);
      }

      return XResult.error(userCredential.error);
    } catch (e, trace) {
      LoggerHelper.error(
          key: "signUpWithEmailPassword",
          text: e.toString() + trace.toString());
      return XResult.exception(e);
    }
  }
}
