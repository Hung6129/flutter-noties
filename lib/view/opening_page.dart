import 'package:flutter/material.dart';

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
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil("/signin/", (route) => false),
              child: const Text(
                "Sign in !!",
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil("/signup/", (route) => false),
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
