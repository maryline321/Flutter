import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/config.dart';
import '../utils/text.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Expanded(
              child: Image.asset(
                  'assets/images/success-icon.png',
                width: 150,
                height: 150,
              ),
            ),

            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Successfully Booked',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Spacer(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child:   Center(
                child: SizedBox(
                  width: 200,
                  height: 50,// Set your desired width
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Config.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('success_booking');
                    },
                    child: Text(
                      AppText.enText['back_home']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}