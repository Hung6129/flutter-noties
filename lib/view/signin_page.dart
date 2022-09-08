import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_noties/view/home_page.dart';

import '../firebase_options.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final _email = TextEditingController();
  late final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In Page"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(hintText: "Input Email"),
                      controller: _email,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration:
                          const InputDecoration(hintText: "Input Password"),
                      controller: _password,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        print(userCredential);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print("User not found");
                        } else if (e.code == 'wrong-password') {
                          print("Wrong password");
                        }
                      }
                       Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Innn !!",
                    ),
                  ),
                ],
              );
            default:
              return const Center(child: Text("Loading"));
          }
        },
      ),
    );
  }
}
