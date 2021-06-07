

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hotels/bottombar.dart';
class Authclass{
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);
FirebaseAuth auth= FirebaseAuth.instance;
final storage= new FlutterSecureStorage();

Future<void> googlesigin(BuildContext context)async{
  try{
    GoogleSignInAccount? googleSignInAccount= await _googleSignIn.signIn();
    if(googleSignInAccount!=null){
      GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount.authentication;
      AuthCredential credential=GoogleAuthProvider.credential(
       idToken: googleSignInAuthentication.idToken,
       accessToken: googleSignInAuthentication.accessToken,
      );
      try{
       UserCredential userCredential=await auth.signInWithCredential(credential);
      storedata(userCredential);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottombar()));
      }catch(e){
        final snackBar=SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }else{
      final snackBar=SnackBar(content: Text("Couldn`t sigin"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }


  }catch(e){
    final snackBar=SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
Future<void> storedata(UserCredential userCredential)async{
  await storage.write(key: "token", value: userCredential.credential.toString());
  await storage.write(key: "userCredential", value: userCredential.toString());
}
Future<String?>gettoken()async{
  return await storage.read(key: "token");
}

Future<void>logout()async{
  try{
  await _googleSignIn.signOut();
  await auth.signOut();
  await storage.delete(key: "token");
  }catch(e){}
}
}