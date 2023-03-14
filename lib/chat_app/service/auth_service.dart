// import 'package:chat2_app/helper/helper_function.dart';
// import 'package:chat2_app/service/database_service.dart';

import 'package:live_streaming_app/chat_app/helper/helper_function.dart';
import 'package:live_streaming_app/chat_app/service/database_service.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:provider/provider.dart';
import 'package:live_streaming_app/providers/user_provider.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login
  Future loginWithUserNameandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailandPassword(
      String username, String email, String password, context) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      if (user != null) {
        // call our database service to update the user data.
        final userProvder = Provider.of<UserProvider>(context, listen: false);
        await DatabaseService(uid: userProvder.user.uid)
            .savingUserData(username, email, context);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
