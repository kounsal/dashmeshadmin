import 'package:dashmeshadmin/firebase_options.dart';
import 'package:dashmeshadmin/global/themes/materialtheme.dart';
import 'package:dashmeshadmin/global/themes/texttheme.dart';
import 'package:dashmeshadmin/screens/homePage.dart';
import 'package:dashmeshadmin/screens/loginPage.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Roboto", "Akshar");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: const Homepage(),
    );
  }
}
