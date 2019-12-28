import 'package:moor/moor_web.dart';

import 'theme_prefs.dart';

MyDatabase constructDb({bool logStatements = false}) {
  return MyDatabase(WebDatabase('db', logStatements: logStatements));
}
