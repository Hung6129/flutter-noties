import 'package:flutter/material.dart';
import 'package:flutter_application_noties/view/signin_page.dart';
import 'package:flutter_application_noties/view/signup_page.dart';

class OpeningPage extends StatelessWidget {
  const OpeningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Noties",
              style: TextStyle(fontSize: 30),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const SignInPage(),
                ),
              ),
              child: const Text(
                "Sign in !!",
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => SignUpPage(),
                ),
              ),
              child: const Text(
                "Don't have an account? Sign up here!!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
