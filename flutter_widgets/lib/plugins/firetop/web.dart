import 'package:fb_auth/fb_auth.dart';
//import 'package:fb_auth/data/classes/auth_user.dart';
//import 'package:fb_auth/data/services/auth/auth.dart';
import 'change_notifier.dart';

class FireAuthService extends BaseAuthService {
  FireAuthService._();
  FireAuthService();

  static final _auth = FBAuth();

  @override
  Future<MyAuthUser> currentUser() async {
    AuthUser user = await _auth.currentUser();
    return user != null
        ? MyAuthUser(
            uid: user.uid, displayName: user.displayName, email: user.email)
        : null;
  }

  @override
  Future<MyAuthUser> signIn(String email, String password) async {
    var auth = await _auth.login(email, password);
    notifyListeners();
    AuthUser user = auth;
    return MyAuthUser(
        uid: user.uid, displayName: user.displayName, email: user.email);
  }

  @override
  Future<MyAuthUser> googleSignIn() async {
    throw ("Not implemented");
  }

  @override
  Future<MyAuthUser> updateUser(MyAuthUser user) async {
//    Firestore _fireStore = Firestore.instance;
//    DocumentReference documentReference =
//        _fireStore.collection('users').document(user.uid);
//
//    documentReference.setData({
//      'uid': user.uid,
//      'displayName': user.displayName,
//      //'photoUrl': user.,
//      'email': user.email,
//      'lastActive': DateTime.now()
//    }, merge: true);

    return user;
  }

  @override
  Future<MyAuthUser> createUser(
      String firstName, String lastName, String email, String password) async {
    var auth = await _auth.createAccount(email, password);
    AuthUser user = auth;
    return MyAuthUser(
        uid: user.uid, displayName: user.displayName, email: user.email);
  }

  @override
  Future<void> signOut() async {
    _auth.logout();
    notifyListeners();
  }
}
