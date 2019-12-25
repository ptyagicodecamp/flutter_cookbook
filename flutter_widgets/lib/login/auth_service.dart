////import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:fb_auth/data/classes/auth_user.dart';
//import 'package:fb_auth/data/services/auth/auth.dart';
//import 'dart:async';
//import 'package:flutter/cupertino.dart';
////import 'package:google_sign_in/google_sign_in.dart';
//
//abstract class BaseAuthService with ChangeNotifier {
//  Future<AuthUser> currentUser();
//  Future<AuthUser> signIn(String email, String password);
//  Future<AuthUser> googleSignIn();
//  Future<AuthUser> updateUser(AuthUser user);
//  Future<AuthUser> createUser(
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:async';
//import 'package:flutter/cupertino.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//abstract class BaseAuthService with ChangeNotifier {
//  Future<FirebaseUser> currentUser();
//  Future<FirebaseUser> signIn(String email, String password);
//  Future<FirebaseUser> googleSignIn();
//  Future<FirebaseUser> updateUser(FirebaseUser user);
//  Future<FirebaseUser> createUser(
//      String firstName, String lastName, String email, String password);
//  Future<void> signOut();
//}
//
//class FireAuthService extends BaseAuthService {
//  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//  final _firebaseAuth = FBAuth();
//
//  @override
//  Future<AuthUser> currentUser() async {
//  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//  @override
//  Future<FirebaseUser> currentUser() async {
//    return await _firebaseAuth.currentUser();
//  }
//
//  @override
//  Future<AuthUser> signIn(String email, String password) async {
//    //try {
////      var auth = await FirebaseAuth.instance
////          .signInWithEmailAndPassword(email: email, password: password);
//    var auth = await _firebaseAuth.login(email, password);
//    notifyListeners();
//    return auth;
////    } catch (e) {
////      throw AuthException(e.code, e.message);
////    }
//  }
//
//  @override
//  Future<AuthUser> googleSignIn() async {
////    try {
////      GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
////      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
////      AuthCredential credential = GoogleAuthProvider.getCredential(
////        accessToken: googleAuth.accessToken,
////        idToken: googleAuth.idToken,
////      );
////
////      FirebaseUser firebaseUser =
////          (await _firebaseAuth.signInWithCredential(credential)).user;
////
////      //creates user entry after logging-in for first tie.
////      updateUser(firebaseUser);
////      notifyListeners();
////
////      return firebaseUser;
////    } catch (e) {
////      throw AuthException(e.code, e.message);
////    }
//  }
//
//  @override
//  Future<AuthUser> updateUser(AuthUser user) async {
////    Firestore _fireStore = Firestore.instance;
////    DocumentReference documentReference =
////        _fireStore.collection('users').document(user.uid);
////
////    documentReference.setData({
////      'uid': user.uid,
////      'displayName': user.displayName,
////      //'photoUrl': user.,
////      'email': user.email,
////      'lastActive': DateTime.now()
////    }, merge: true);
//  Future<FirebaseUser> signIn(String email, String password) async {
//    try {
//      var auth = await FirebaseAuth.instance
//          .signInWithEmailAndPassword(email: email, password: password);
//      notifyListeners();
//      return auth.user;
//    } catch (e) {
//      throw AuthException(e.code, e.message);
//    }
//  }
//
//  @override
//  Future<FirebaseUser> googleSignIn() async {
//    try {
//      GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//      AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: googleAuth.accessToken,
//        idToken: googleAuth.idToken,
//      );
//
//      FirebaseUser firebaseUser =
//          (await _firebaseAuth.signInWithCredential(credential)).user;
//
//      //creates user entry after logging-in for first tie.
//      updateUser(firebaseUser);
//      notifyListeners();
//
//      return firebaseUser;
//    } catch (e) {
//      throw AuthException(e.code, e.message);
//    }
//  }
//
//  @override
//  Future<FirebaseUser> updateUser(FirebaseUser user) async {
//    Firestore _fireStore = Firestore.instance;
//    DocumentReference documentReference =
//        _fireStore.collection('users').document(user.uid);
//
//    documentReference.setData({
//      'uid': user.uid,
//      'displayName': user.displayName,
//      'photoUrl': user.photoUrl,
//      'email': user.email,
//      'lastActive': DateTime.now()
//    }, merge: true);
//
//    return user;
//  }
//
//  @override
//  Future<AuthUser> createUser(
//      String firstName, String lastName, String email, String password) async {
////    var auth = await FirebaseAuth.instance
////        .createUserWithEmailAndPassword(email: email, password: password);
//    var auth = await _firebaseAuth.createAccount(email, password);
////    UserUpdateInfo info = UserUpdateInfo();
////    info.displayName = '$firstName $lastName';
//
//    //await auth.user.updateProfile(info);
//
//    return auth;
//  Future<FirebaseUser> createUser(
//      String firstName, String lastName, String email, String password) async {
//    var auth = await FirebaseAuth.instance
//        .createUserWithEmailAndPassword(email: email, password: password);
//    UserUpdateInfo info = UserUpdateInfo();
//    info.displayName = '$firstName $lastName';
//    await auth.user.updateProfile(info);
//
//    return auth.user;
//  }
//
//  @override
//  Future<void> signOut() async {
//    _firebaseAuth.logout();
//    _firebaseAuth.signOut();
//    notifyListeners();
//  }
//}
