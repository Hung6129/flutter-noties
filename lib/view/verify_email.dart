import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({Key? key}) : super(key: key);

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                Navigator.pop(context);
                // if (user?.emailVerified == true) {
                //   return await const SignInPage();
                // } else {}
              },
              child: const Text("Send email verification"),
            ),
          ],
        ),
      ),
    );
  }
}
