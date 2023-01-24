import 'index.dart';

class CSHelpDeskFirebaseAuth {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static createUser({required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print('User created: ${user!.uid}');
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static signOut() async {
    try {
      await _auth.signOut();
      print('User signed out');
    } catch (e) {
      print(e.toString());
    }
  }


void resetPassword({required String email}) async {
  try {
    await _auth.sendPasswordResetEmail(email: email);
    print('Password reset email sent to $email');
  } catch (e) {
    print(e.toString());
  }
}
}
