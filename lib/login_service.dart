import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  final FirebaseAuth _auth;

  LoginService({required auth}) : _auth = auth;

  Stream<User?> get onAuthStateChanged => _auth.authStateChanges();

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("$e");
    }
  }

  Future<void> signUpUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print("$e");
    }
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("$e");
    }
  }

  User? getUser() {
    return _auth.currentUser;
  }
}
