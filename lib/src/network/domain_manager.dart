import 'package:together/src/network/data/user/user_repository.dart';
import 'package:together/src/network/data/user/user_repository_impl.dart';

class DomainManager {
  late UserRepository user;

  DomainManager() {
    user = UserRepositoryImpl();
  }
}
