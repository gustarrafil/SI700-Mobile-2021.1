import 'package:cripose/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future signInAnon() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();

//       User user = result.user!;
//       return user;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }


class FirebaseAuthenticationService {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    Stream<UserModel> get user {
        return _firebaseAuth
                .authStateChanges()
                .map((User? user) {
                        return _userFromFirebase(user);
                } );
    }

    UserModel _userFromFirebase(User? user) {
        // ignore: unnecessary_null_comparison
        String users = user?.uid as String;
        return UserModel(uid: users);

    }

    Future<UserModel> signInAnonimo() async {
        UserCredential authResult = await _firebaseAuth.signInAnonymously();
        User user = authResult.user as User;
        return UserModel(uid: user.uid);
    }

    signInWithEmail({required String email, required String pwd}) async {
        UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pwd);
        User user = authResult.user as User;
        return UserModel(uid: user.uid);
    }

    createUser({required String email, required String pwd}) async {
        UserCredential authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pwd);
        User user = authResult.user as User;
        return UserModel(uid: user.uid);
    }

    signOut() async {
        await _firebaseAuth.signOut();
    }
}