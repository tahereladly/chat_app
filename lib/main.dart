import 'package:chat_app/components/Constant.dart';
import 'package:chat_app/modules/chat_screen/Chat_Screen.dart';
import 'package:chat_app/modules/login/Login_Screen.dart';
import 'package:chat_app/modules/register/Register_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        LoginScreen.id:(context)=>   LoginScreen(),
        RegisterScreen.id :(context)=>const RegisterScreen(),
        ChatScreen.id:(context)=> ChatScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: kBackGroundColor,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),

      ),
      initialRoute: LoginScreen.id,
    );
  }
}

