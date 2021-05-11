import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AAppFirebaseUser {
  AAppFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

AAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AAppFirebaseUser> aAppFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<AAppFirebaseUser>((user) => currentUser = AAppFirebaseUser(user));
