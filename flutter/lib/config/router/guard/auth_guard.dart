import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(ExtendedNavigatorState<RouterBase> navigator,
      String routeName, Object arguments) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') != null;
  }
}
