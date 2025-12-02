import 'package:fluttertoast/fluttertoast.dart';

class BackPressHandler {
  BackPressHandler._();
  static final BackPressHandler instance = BackPressHandler._();
  DateTime? lastBackPressed;

  /// Call this inside WillPopScope's onWillPop
  Future<bool> onWillPop() async {
    final now = DateTime.now();
    if (lastBackPressed == null || now.difference(lastBackPressed!) > const Duration(seconds: 2)) {
      lastBackPressed = now;
      Fluttertoast.showToast(msg: "Press back again to exit", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
      return false;
    }
    return true;
  }
}
