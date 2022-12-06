import 'package:firstprogflutter/core/data_base_helper.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseHelper.instance.init();
  runApp(Container());
}
