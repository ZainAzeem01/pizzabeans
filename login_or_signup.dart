import 'package:flutter/cupertino.dart';
import 'package:pizzabeans/pages/login.dart';
import 'package:pizzabeans/pages/signup.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});
  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();

}

class _LoginOrSignupState extends State<LoginOrSignup>{
  bool islogin = true;
  void togglePage(){
    setState(() {
      islogin=!islogin;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(islogin){
      return LoginPage(
        onPressed: togglePage,
      );
    }else{
      return SignUpPage(
        onPressed: togglePage,
      );
    }
  }

}
