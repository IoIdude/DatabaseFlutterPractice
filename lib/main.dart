import 'package:flutter/material.dart';
import 'package:firstprogflutter/core/data_base_helper.dart';
import 'package:firstprogflutter/common/url_page.dart';
import 'package:firstprogflutter/presentation/admin/admin_home.dart';
import 'package:firstprogflutter/presentation/auth/sign_in.dart';
import 'package:firstprogflutter/presentation/auth/sign_up.dart';
import 'package:firstprogflutter/presentation/user/user_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseHelper.instance.init();
  print(DateTime.now());
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: UrlPage.singIn,
      routes: {
        UrlPage.admin: (context) => AdminHome(),
        UrlPage.user: (context) => UserHome(),
        UrlPage.singIn: (context) => SignIn(),
        UrlPage.signUp: (context) => SignUp()
      },
    );
  }
}
