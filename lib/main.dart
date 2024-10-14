import 'package:chatter_whydots/screens/chat_screen.dart';
import 'package:chatter_whydots/screens/login_screen.dart';
import 'package:chatter_whydots/screens/registration_screen.dart';
import 'package:chatter_whydots/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDccWJkTLuNnMYMxF4tdrn-3wN6MvbGVAM",
      appId: "1:151892312841:android:de26c3ac3c02265942c9d8",
      messagingSenderId: "151892312841",
      projectId: "flashchatwhydots",
    ),
  );
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.black54,
            ),
            bodyMedium: TextStyle(
              color: Colors.black54,
            ),
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            foregroundColor: Colors.lightBlueAccent,
          )),
      initialRoute: WelcomeScreen.id,
      routes: <String, Widget Function(BuildContext)>{
        ChatScreen.id: (context) => const ChatScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        RegistrationScreen.id: (context) => const RegistrationScreen(),
      },
    );
  }
}
