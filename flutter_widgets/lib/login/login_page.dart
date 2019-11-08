import 'package:flutter/material.dart';
import 'package:flutter_widgets/plugins/firetop/change_notifier.dart';
import 'package:flutter_widgets/plugins/firetop/fire_auth_service.dart';
import 'package:provider/provider.dart';
import '../widgets_lib.dart';

class LogInPage extends StatefulWidget {
  final String title;
  final void Function(MyAuthUser) onSignIn;

  LogInPage({Key key, this.title, this.onSignIn}) : super(key: key);

  @override
  _LogInPageState createState() => new _LogInPageState();
}

enum FormType { login, register }

class _LogInPageState extends State<LogInPage> {
  static final formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String _hintText = '';
  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Card(
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                      Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: loginForm() +
                                    [
                                      SizedBox(
                                        height: 30,
                                      )
                                    ] +
                                    submissionOptions(), // adding two widget lists
                              ))),
                    ])),
                hintText(),
                SizedBox(
                  height: 50,
                ),
                LogInButton(
                    key: Key('signin_google'),
                    text: 'SignIn With Google',
                    height: 44.0,
                    backgroundColor: Colors.cyan,
                    onPressed: () async {
                      MyAuthUser user =
                          await Provider.of<FireAuthService>(context)
                              .googleSignIn();

                      widget.onSignIn(user);
                    })
              ]))),
    );
  }

  void submitForm() async {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      //hides keyboard
      FocusScope.of(context).requestFocus(new FocusNode());
      try {
        MyAuthUser myAuthUser = _formType == FormType.login
            ? await Provider.of<FireAuthService>(context)
                .signIn(_email, _password)
            : await Provider.of<FireAuthService>(context)
                .createUser(_email, '', _email, _password);

        String userId = myAuthUser.uid;

        setState(() {
          _hintText = 'Signed In\n\nUser id: $userId';
          //user created his account. Now directly sign-in
          widget.onSignIn(myAuthUser);
        });
      } catch (e) {
        setState(() {
          if (e.code == 'ERROR_USER_NOT_FOUND') {
            _hintText = 'Login not found. Please register first.';
          } else {
            _hintText = 'Sign In Error\n\n${e.message}';
          }
        });
      }
    } else {
      setState(() {
        _hintText = '';
      });
    }
  }

  void register() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
      _hintText = '';
    });
  }

  void signIn() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
      _hintText = '';
    });
  }

  List<Widget> loginForm() {
    return [
      padded(
          child: TextFormField(
        key: Key('email'),
        decoration: InputDecoration(labelText: 'Email'),
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Email can\'t be empty.' : null,
        onSaved: (val) => _email = val,
      )),
      padded(
          child: TextFormField(
        key: Key('password'),
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        autocorrect: false,
        validator: (val) => val.isEmpty ? 'Password can\'t be empty.' : null,
        onSaved: (val) => _password = val,
      )),
    ];
  }

  List<Widget> submissionOptions() {
    switch (_formType) {
      case FormType.login:
        return [
          LogInButton(
              key: Key('login'),
              text: 'Login',
              height: 44.0,
              backgroundColor: Colors.blue,
              onPressed: submitForm),
          SizedBox(
            height: 10,
          ),
          FlatButton(
              key: Key('register'),
              child: Text(
                "Need an account? Register",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              onPressed: register),
        ];
      case FormType.register:
        return [
          LogInButton(
              key: Key('create_account'),
              text: 'Register',
              height: 44.0,
              backgroundColor: Colors.blue,
              onPressed: submitForm),
          SizedBox(
            height: 10,
          ),
          FlatButton(
              key: Key('sign_in'),
              child: Text(
                "Registered already ? Login",
                style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              onPressed: signIn),
        ];
    }
    return null;
  }

  Widget hintText() {
    return Container(
        padding: const EdgeInsets.all(32.0),
        child: new Text(_hintText,
            key: Key('hint_text'),
            style: TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center));
  }

  Widget padded({Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }
}
