import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../model/response_model.dart';

class FirebaseAuthHelper {
  final authRef = FirebaseAuth.instance;

  Future<ResponseModel> createAuth({required String email, required String pass}) async {
    try {
      final credential = await authRef.createUserWithEmailAndPassword(email: email, password: pass);
      return ResponseModel(isSuccessful: true, returnData: credential.user!.uid);
    } on FirebaseAuthException catch(e) {
      return ResponseModel(isSuccessful: false, returnData: e.code);
    } catch (e) {
      log(e.toString());
      return ResponseModel(isSuccessful: false);
    }
  }

  Future<ResponseModel> loginUser(String email, String pass) async {
    try {
      final credential = await authRef.signInWithEmailAndPassword(email: email, password: pass);
      return ResponseModel(isSuccessful: true, returnData: credential.user!.uid);
    } on FirebaseAuthException catch(e) {
      return ResponseModel(isSuccessful: false, returnData: e.code);
    } catch (e) {
      log(e.toString());
      return ResponseModel(isSuccessful: false);
    }
  }
}