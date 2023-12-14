import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = FutureProvider.autoDispose<User?>((ref) async {
  return FirebaseAuth.instance.authStateChanges().first;
});

final authStateChangesProvider = StreamProvider.autoDispose<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

int index1 = 1;

final bottomIndex = StateProvider<int>((ref) => index1);
bool disable = false;

final disableProvider = StateProvider<bool>((ref) => disable);

String number = "";
