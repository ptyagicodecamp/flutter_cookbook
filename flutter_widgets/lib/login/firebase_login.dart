import 'package:fb_auth/data/classes/auth_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/plugins/firetop/change_notifier.dart';
import 'package:flutter_widgets/plugins/firetop/fire_auth_service.dart';
import 'package:flutter_widgets/widgets_lib.dart';
import 'package:provider/provider.dart';
import 'auth_service.dart';
import 'user_profile.dart';
import 'login_page.dart';
import 'package:flutter_widgets/router.dart' as router;

//user Firebase Auth to login using Google account credentials
class FirebaseAuthLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirebaseAuthLoginState();
  }
}

class _FirebaseAuthLoginState extends State<FirebaseAuthLogin> {
  static bool noData = false;
  static MyAuthUser user;

  @override
  Widget build(BuildContext context) {
    return startDemo();
  }

  Widget startDemo() {
    if (noData) {
      return LogInPage(
        title: 'Login',
        onSignIn: (user) => signIn(user),
      );
    }

    return futureWidget();
  }

  void signIn(MyAuthUser user) {
    Navigator.popAndPushNamed(context, router.USER_PROFILE, arguments: user);
  }

  void signOut() {
    Navigator.popAndPushNamed(context, router.LOGIN_PAGE);
  }

  FutureBuilder futureWidget() {
    return FutureBuilder<MyAuthUser>(
      future: Provider.of<FireAuthService>(context).currentUser(),
      builder: (context, AsyncSnapshot<MyAuthUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.error != null) {
            return Text(snapshot.error.toString());
          }

          if (snapshot.hasData) {
            user = snapshot.data;

            return UserProfilePage(
                currentUser: user, onSignOut: () => signOut());
          }

          noData = true;

          return Center(
              child: Padding(
            padding: EdgeInsets.all(30),
            child: LogInButton(
                key: Key('play_demo'),
                text: 'Click to Demo',
                height: 60.0,
                backgroundColor: Colors.blue[600],
                onPressed: () {
                  Navigator.popAndPushNamed(context, router.FIREBASE_LOGIN);
                }),
          ));
        } else {
          return Container(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
