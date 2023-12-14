import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:interview/Controller.dart';
import 'package:interview/views/HomePage.dart';
import 'package:interview/views/LoginPage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Firebase Auth Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthWrapper());
  }
}

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider);

    if (user.asData?.value != null) {
      return MainPage();
    } else {
      return const LoginPage();
    }
    // user.when(data: (data) {
    //   if (data != null) {
    //     return MainPage();
    //   } else {
    //     return const LoginPage();
    //   }
    // }, error: (error, strace) {
    //   return const LoginPage();
    // }, loading: () {
    //   return const LoginPage();
    // });
  }
}
