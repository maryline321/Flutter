
import 'package:doctor_appointment/components/button.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:doctor_appointment/utils/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override

  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass =true;
  @override
  Widget build(BuildContext context) {
    return Form(
     key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              labelText: 'Email',
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),

          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outline),
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obsecurePass = !obsecurePass;
                    });
                  },
                  icon: obsecurePass
                  ?  const Icon(
                    Icons.visibility_off_outlined,
                    color: Colors.black38,
                  ) :const Icon(
                    Icons.visibility_outlined,
                    color: Config.primaryColor,
                  )
              )
            ),

          ),
          Config.spaceSmall,
          Center(
            child: SizedBox(
              width: 200,
              height: 50,// Set your desired width
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Config.primaryColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('main');
                },
                child: Text(
                  AppText.enText['signIn']!,
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
      ),
    );
  }

}