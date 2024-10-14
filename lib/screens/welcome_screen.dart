import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatter_whydots/components/round_action_button.dart';
import 'package:chatter_whydots/screens/login_screen.dart';
import 'package:chatter_whydots/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static String id = '/welcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animatable animationColor; //changed from Animation
  late Animation animationValue;

  @override
  void initState() {
    super.initState();
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animationValue = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInCirc,
    );
    animationColor = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationColor.transform(animationValue.value),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                // const Text(
                //   'Flash Chat',
                //   style: TextStyle(
                //     fontSize: 45,
                //     fontWeight: FontWeight.w900,
                //   ),
                // ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    speed: const Duration(milliseconds: 100),
                    textStyle: const TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    cursor: '|',
                    curve: Curves.easeInCubic,
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: RoundActionButton(
                label: 'Log In',
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
            ),
            RoundActionButton(
              label: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
