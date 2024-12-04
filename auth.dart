import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzabeans/pages/login.dart';
import 'package:pizzabeans/pages/home.dart';
import 'package:pizzabeans/pages/login_or_signup.dart';
class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){  //internet issue
              return const CircularProgressIndicator();
            }else{
              if(snapshot.hasData){
                //User logged in to home page
                return HomePage();
              }else{
                //user is not logged in navigate to login page
                return const LoginOrSignup();
              }
            }
          },
        ),
    );
  }
}