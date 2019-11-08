import 'change_notifier.dart';

class FireAuthService extends BaseAuthService {
  FireAuthService._();

  FireAuthService();

  @override
  Future<MyAuthUser> createUser(
      String firstName, String lastName, String email, String password) {
    throw ("Platform not found");
  }

  @override
  Future<MyAuthUser> currentUser() {
    throw ("Platform not found");
  }

  @override
  Future<MyAuthUser> googleSignIn() {
    throw ("Platform not found");
  }

  @override
  Future<MyAuthUser> signIn(String email, String password) {
    throw ("Platform not found");
  }

  @override
  Future<void> signOut() {
    throw ("Platform not found");
  }

  @override
  Future<MyAuthUser> updateUser(Object user) {
    throw ("Platform not found");
  }
}
