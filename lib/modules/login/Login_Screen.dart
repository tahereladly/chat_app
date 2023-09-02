// ignore_for_file: file_names

import 'package:chat_app/components/Constant.dart';
import 'package:chat_app/components/Custom_Button.dart';
import 'package:chat_app/components/Custom_TextField.dart';
import 'package:chat_app/components/Custom_AppBar.dart';
import 'package:chat_app/modules/chat_screen/Chat_Screen.dart';
import 'package:chat_app/modules/register/Register_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'Login Screen';

  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool isVisible = true;
  signIn() async {
    isLoading = true;
    setState(() {});
    try {
      // ignore: unused_local_variable
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, ChatScreen.id,
          arguments: emailController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
        showSnackBar('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar('Wrong password provided for that user.');
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showSnackBar('some error occurs');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Sign In',
          logo: KLogo,
          background: const Color(0xff284461),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const ImageForm(),
                      const Text(
                        'Scholar Chat',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'pacifico'),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomTextField(
                        hintText: 'Enter your email',
                        style: const TextStyle(color: Colors.white),
                        labelText: 'Email',
                        type: TextInputType.emailAddress,
                        prefix: const Icon(
                          Icons.email,
                        ),
                        isVisible: true,
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        hintText: 'Enter your Password',
                        style: const TextStyle(color: Colors.white),
                        labelText: 'Password',
                        type: TextInputType.visiblePassword,
                        prefix: const Icon(
                          Icons.lock,
                        ),

                        isVisible: true,
                        suffix: IconButton(
                          icon: isVisible
                              ? const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                ),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        ),
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        label: 'Login',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            signIn();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'don\'t have an account ?',
                            style: TextStyle(
                              color: Color(0xffB4D5DE),
                              fontSize: 18,
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RegisterScreen.id);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xffB4D5DE),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
