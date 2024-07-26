import 'package:dashmeshadmin/services/databaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';

// firebaseauth.FirebaseAuth auth = firebaseauth.FirebaseAuth.instance;
class AuthServices {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future registerUserwithEmaiandPassword(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      await user.sendEmailVerification();

      // ignore: unnecessary_null_comparison
      if (user != null) {
        //storing data to db
        await DatabaseService(uid: user.uid).savingUserData("AMARPREET", email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future loginUserwithEmaiandPassword(
      // ignore: non_constant_identifier_names

      String email,
      String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      // ignore: unnecessary_null_comparison
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
