import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_noties/firebase_options.dart';
import 'package:flutter_application_noties/view/verify_email.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          FutureBuilder(
            future: Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (user.emailVerified == false) {
                    return IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const VerifyView(),
                        ),
                      ),
                      icon: const Icon(
                        Icons.verified_user,
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.verified_user,
                        color: Colors.green,
                      ),
                    );
                  }
                default:
                  return IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.yellow,
                    ),
                  );
              }
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
