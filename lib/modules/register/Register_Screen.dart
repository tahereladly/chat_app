// ignore: file_names
import 'package:chat_app/components/Constant.dart';
import 'package:chat_app/components/Custom_AppBar.dart';
import 'package:chat_app/components/Custom_Button.dart';
import 'package:chat_app/components/Custom_TextField.dart';
import 'package:chat_app/modules/chat_screen/Chat_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  static String id ='Register Screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isLoading = false;
  signUP() async {
    setState(() {
      isLoading = true;
    });
    try {
      // ignore: unused_local_variable
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      showSnackBar('The account created successfully.');
          Navigator.pushNamed(context, ChatScreen.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar('The account already exists for that email.');
      }
    } catch (e) {
      showSnackBar('some error occurs');
    }
    setState(() {
      isLoading = false;
    });
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
          title: 'Sign Up',
          logo: KLogo,

          background: const Color(0xff284461),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
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
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    labelText: 'Email',
                    type: TextInputType.emailAddress,
                    prefix: const Icon(
                      Icons.email,
                    ),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'Enter your Password',
                    style: const TextStyle(
                        color: Colors.white
                    ),
                    labelText: 'Password',
                    type: TextInputType.visiblePassword,
                    prefix: const Icon(
                      Icons.lock,
                    ),
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    label: 'Register',
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        signUP();
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
                        'have an account ?',
                        style: TextStyle(
                          color: Color(0xffB4D5DE),
                          fontSize: 18,
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign In",
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
    );
  }
}
