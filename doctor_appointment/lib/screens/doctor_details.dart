import 'package:doctor_appointment/components/custom_appbar.dart';
import 'package:doctor_appointment/components/login.dart';
import 'package:doctor_appointment/components/social_button.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:doctor_appointment/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}
class _DoctorDetailsState extends State<DoctorDetails> {

  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              isFav = !isFav;
            });
          },
              icon: FaIcon(
                isFav ? Icons.favorite_rounded: Icons.favorite_outline,
                color: Colors.red,
              )
          )
        ],
      ),
      body: const SafeArea(
        child: Column(
          children: <Widget>[
            DoctorProfile(),
          ],
        ),
      ),


    );
  }
}


class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/images/doctor.png'),
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 5,),
          const Text(
            'Dr Rose',
            style: TextStyle(
            color:Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'An oncologist is a healthcare provider who specializes in diagnosing and treating cancer'
                  'Molars Dental Clinics have '
                  'conglomerated a unique set of '
                  'expertise, intellect and equipment '
                  'to cater to the health of your smile. '
                  'Our dentistry experience spanning over 10 years,'
                  ' has edified our service menu and sensitivity to offer more than oral health care. We have been able to gain invaluable experience in treating '
                  'thousands of patients and take pride in being in the forefront'
                  ' of handling difficult referral cases in the industry.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Tenwek General Hospital',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}


class DoctorBody extends StatelessWidget {
  const DoctorBody({super.key});

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
        ],
      ),
    );
  }
}