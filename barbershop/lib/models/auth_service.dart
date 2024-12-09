
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> login(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
  }

  Future<UserCredential> register(String email, String password, String name) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user?.updateDisplayName(name);
      await userCredential.user?.reload();
      await logout();

      return userCredential;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  User? getCurrentUser()  {
    return _firebaseAuth.currentUser;
  }

  static bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.displayName != null;
  }
}