import 'package:doctor_appointment/components/login.dart';
import 'package:doctor_appointment/components/social_button.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:doctor_appointment/utils/text.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    // Initialize Config in the build method
    Config.init(context);

    return Scaffold(
      body:
         Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppText.enText['welcome_text']!,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall, // Use Config.spaceSmall directly
                Text(
                  AppText.enText['signIn_text']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall, // Use Config.spaceSmall directly
                const LoginScreen(),

                Config.spaceSmall, // Use Config.spaceSmall directly
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Navigator.of(context).pushNamed('main');
                    },
                    child: Text(
                      AppText.enText['forgot_password']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Text(
                    AppText.enText['social_login']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Config.spaceSmall, // Use Config.spaceSmall directly
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                      child: SocialButton(social: 'google'),
                    ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                      child: SocialButton(social: 'facebook'),
                    ),
                    ),
                  ],
                ),

                Config.spaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      AppText.enText['signup_text']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
            Center(
              child: SizedBox(
                child: TextButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed('main');
                  },
                  child: Text(
                    AppText.enText['signUp']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),


                  ],
                )//
              ],
            ),
          ),
        ),

    );
  }
}
