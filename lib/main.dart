import 'package:flutter/material.dart';
import 'package:flutter_application_noties/view/home_page.dart';
import 'package:flutter_application_noties/view/opening_page.dart';
import 'package:flutter_application_noties/view/signin_page.dart';
import 'package:flutter_application_noties/view/signup_page.dart';
import 'package:flutter_application_noties/view/verify_email.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/signin/": (context) => const SignInPage(),
        "/signup/": (context) => const SignUpPage(),
        "/home/": (context) => const HomePage(),
        "/open/": (context) => const OpeningPage(),
        "/verify/": (context) => const VerifyView(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OpeningPage(),
    );
  }
}
