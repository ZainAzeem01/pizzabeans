import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onPressed;
  const SignUpPage({super.key, this.onPressed});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}



class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading=false;
  // Sign in method
  createUserWithEmailAndPassword() async{
    try {
      setState(() {
        isLoading=true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );

        setState(() {
          isLoading=false;
        });
    }on FirebaseAuthException catch (e) {
      setState(() {
        isLoading=false;
      });

      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The password provided is too weak.'),
            ),
        );
        }else if (e.code == 'email-already-in-use') {
          return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('The account already exists for that email.'),
              ),
        );
      }
    }

    catch(e){
  setState(() {
  isLoading=false;
  });

      print(e);
    }
  }



  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/welcome_top_shape.png'), // Replace with your image path
              fit: BoxFit.cover, // Ensures the image covers the space
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'lib/assets/welcome_top_shape.png', // Replace with your image path
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _email,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Email is empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _password,
                  obscureText: true,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Password is empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        createUserWithEmailAndPassword();
                      }
                      // Add signup functionality here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Signup clicked')),
                      );
                    },
                      child:isLoading
                          ? const Center(child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      )
                          :
                       const Text("Signup"),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: widget.onPressed,
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
