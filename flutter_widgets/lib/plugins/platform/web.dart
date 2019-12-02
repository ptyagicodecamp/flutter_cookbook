import 'package:flutter_widgets/plugins/platform/myplatform.dart';

class PlatformUtil {
  static MyPlatform myPlatform() {
    return MyPlatform.WEB;
  }

  static void speak(String txt) {}
}
