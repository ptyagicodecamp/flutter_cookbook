import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser firebaseUser =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    //creates user entry after logging-in for first tie.
    updateUser(MyAuthUser(
        uid: firebaseUser.uid,
        displayName: firebaseUser.displayName,
        email: firebaseUser.email));
    notifyListeners();

    return MyAuthUser(
        uid: firebaseUser.uid,
        displayName: firebaseUser.displayName,
        email: firebaseUser.email);
  }

  @override
  Future<MyAuthUser> updateUser(MyAuthUser myAuthUser) async {
    FirebaseUser user = myAuthUser as FirebaseUser;
    Firestore _fireStore = Firestore.instance;
    DocumentReference documentReference =
        _fireStore.collection('users').document(user.uid);

    documentReference.setData({
      'uid': user.uid,
      'displayName': user.displayName,
      //'photoUrl': user.,
      'email': user.email,
      'lastActive': DateTime.now()
    }, merge: true);

    return myAuthUser;
  }

  @override
  Future<MyAuthUser> createUser(
      String firstName, String lastName, String email, String password) async {
    var auth = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = '$firstName $lastName';

    await auth.user.updateProfile(info);

    FirebaseUser user = auth.user;
    return MyAuthUser(
        uid: user.uid, displayName: user.displayName, email: user.email);
  }

  @override
  Future<void> signOut() async {
    _auth.logout();
    notifyListeners();
  }
}
