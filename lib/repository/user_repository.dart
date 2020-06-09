
//1. Imports
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepository{

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

//2. Constructor
UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
: _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
_googleSignIn = googleSignIn ?? GoogleSignIn();

//3. SignInWithGoogle
Future<FirebaseUser> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = 
    await googleUser.authentication;
  final AuthCredential credential =
    GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken, 
      accessToken: googleAuth.accessToken
      );
  await _firebaseAuth.signInWithCredential(credential);
  return _firebaseAuth.currentUser();
}

//4. SignInWithCredentials
Future<void> signInWithCredentials(String email, String password){
  return _firebaseAuth.signInWithEmailAndPassword(
    email: email, 
    password: password
  );
}

//5. SignUp - Registro
Future<void> signUp(String email, String password) async {
  return await _firebaseAuth.createUserWithEmailAndPassword(
    email: email, 
    password: password
  );
}

//6. SingOut
Future<void> signOut() async {
  return Future.wait([
    _firebaseAuth.signOut(),
    _googleSignIn.signOut(),
  ]);
}

//7. Esta logueado ?
Future<bool> isSignedIn() async {
  final currentUser = await _firebaseAuth.currentUser();
  return currentUser != null;
}
//8. Obtener Usuario
Future<String> getUser() async {
  return (await _firebaseAuth.currentUser()).email;
 }
}



