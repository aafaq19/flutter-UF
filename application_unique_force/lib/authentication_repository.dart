import 'package:application_unique_force/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:application_unique_force/login_attendance.dart';

class Authenticationrepository extends GetxController {
  static Authenticationrepository get instance => Get.find();

  final auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const ())
        : Get.offAll(() => const Dashboard());
  }

  Future<void> createUserwithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const LoginScreen())
          : Get.off(() => const Dashboard());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      if (kDebugMode) {
        print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      }
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        print('EXCEPTION - ${ex.message}');
      }
      throw ex;
    }
  }

  Future<void> loginUserwithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      if (kDebugMode) {
        print('LOGIN FIREBASE AUTH EXCEPTION - ${ex.message}');
      }
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      if (kDebugMode) {
        print('LOGIN EXCEPTION - ${ex.message}');
      }
      throw ex;
    }
  }

  Future<void> logout() async {
    await auth.signOut();
    Get.offAll(() => const ());
  }
}

class Dashboard {
  const Dashboard();
}
