import 'package:fb_auth/data/classes/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/login/auth_service.dart';
import 'package:flutter_widgets/plugins/firetop/change_notifier.dart';
import 'package:flutter_widgets/plugins/firetop/fire_auth_service.dart';
import 'package:provider/provider.dart';

//user Firebase Auth to login using Google account credentials
class UserProfilePage extends StatefulWidget {
  final MyAuthUser currentUser;
  final VoidCallback onSignOut;

  UserProfilePage({this.currentUser, this.onSignOut});

  @override
  State<StatefulWidget> createState() {
    return _UserProfilePageState();
  }
}

class _UserProfilePageState extends State<UserProfilePage> {
  String photoUrl = "";
  String displayName = "No Name Yet !";

  @override
  Widget build(BuildContext context) {
    if (widget.currentUser != null) {
//      if (widget.currentUser.photoUrl != null) {
//        photoUrl = widget.currentUser.photoUrl;
//      }

      if (widget.currentUser.displayName != null) {
        displayName = widget.currentUser.displayName;
      } else {
        displayName = widget.currentUser.email;
      }
    } else {
      displayName = 'Not Logged in';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome ' + displayName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  radius: 200,
                  child: photoUrl != null
                      ? Image.network(
                          photoUrl,
                          fit: BoxFit.fitHeight,
                        )
                      : CircleAvatar(
                          child: Text('Photo'),
                        ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('Log out'),
                onPressed: () async {
                  await Provider.of<FireAuthService>(context).signOut();
                  //Navigator.pushReplacementNamed(context, router.FIREBASE_LOGIN);
                  widget.onSignOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/gestures.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_widgets/home.dart';
//import 'package:flutter_widgets/login/auth_service.dart';
//import 'package:flutter_widgets/menus/webview.dart';
//import 'package:flutter_widgets/router.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:provider/provider.dart';
//import 'package:flutter_widgets/router.dart' as router;
//
////user Firebase Auth to login using Google account credentials
//class UserProfilePage extends StatefulWidget {
//  final FirebaseUser currentUser;
//  final VoidCallback onSignOut;
//
//  UserProfilePage({this.currentUser, this.onSignOut});
//
//  @override
//  State<StatefulWidget> createState() {
//    return _UserProfilePageState();
//  }
//}
//
//class _UserProfilePageState extends State<UserProfilePage> {
//  String photoUrl = "";
//  String displayName = "No Name Yet !";
//
//  @override
//  Widget build(BuildContext context) {
//    if (widget.currentUser != null) {
//      if (widget.currentUser.photoUrl != null) {
//        photoUrl = widget.currentUser.photoUrl;
//      }
//
//      if (widget.currentUser.displayName != null) {
//        displayName = widget.currentUser.displayName;
//      } else {
//        displayName = widget.currentUser.email;
//      }
//    } else {
//      displayName = 'Not Logged in';
//    }
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Profile Page'),
//      ),
//      body: SingleChildScrollView(
//        child: Center(
//          child: Column(
//            children: <Widget>[
//              SizedBox(
//                height: 20.0,
//              ),
//              Text(
//                'Welcome ' + displayName,
//                style: TextStyle(
//                    fontSize: 20,
//                    fontWeight: FontWeight.bold,
//                    fontStyle: FontStyle.normal),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              SizedBox(
//                height: 100,
//                width: 100,
//                child: CircleAvatar(
//                  radius: 200,
//                  child: photoUrl != null
//                      ? Image.network(
//                          photoUrl,
//                          fit: BoxFit.fitHeight,
//                        )
//                      : CircleAvatar(
//                          child: Text('Photo'),
//                        ),
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              RaisedButton(
//                child: Text('Log out'),
//                onPressed: () async {
//                  await Provider.of<FireAuthService>(context).signOut();
//                  //Navigator.pushReplacementNamed(context, router.FIREBASE_LOGIN);
//                  widget.onSignOut();
//                },
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
