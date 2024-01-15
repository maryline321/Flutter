import 'package:doctor_appointment/components/button.dart';
import 'package:doctor_appointment/components/custom_appbar.dart';
import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/text.dart';

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
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const DoctorProfile(),
            const Expanded(
              child: SingleChildScrollView(
                child: DoctorBody(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child:  Center(
                child: SizedBox(
                  width: 200,
                  height: 50,// Set your desired width
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Config.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('bookings_page');
                    },
                    child: Text(
                      AppText.enText['booking']!,
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
          Config.spaceMedium,
          const Text(
            'Dr Rose',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Doctor of Dental Medicine (DMD)'
              'Oxford University'
              '• Biopsy  Endoscopy (Colonoscopy and gastrostomy '
              'Retro peritoneal lymph node excision Laparoscopic splenectomy',
              style: TextStyle(fontSize: 15, color: Colors.grey),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Tenwek General Hospital',
              style: TextStyle(fontSize: 15, color: Colors.black),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          // Config.spaceSmall,
          // DoctorDetails(),
          // Config.spaceSmall,
          // DoctorInfo(),
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
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          const DoctorInfo(),
          Config.spaceMedium,
          const Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Config.spaceSmall,
          const Text(
            'Dr. Rose is a dedicated and skilled dental'
            ' doctor who specializes in oral health and '
            'hygiene. With a passion for providing comprehensive'
            ' dental care, Dr. Rose is committed to helping '
            'patients achieve and maintain optimal oral well-being.'
            ' Her expertise encompasses a wide range of dental services, including preventive care, '
            'restorative procedures, and cosmetic dentistry.'
                'As the premier dental clinic in Nairobi, we take pride in delivering top-notch dental care services to our patients. At our clinic, we define Dental Excellence as a commitment to providing our patients with the highest level of dental care that meets their unique needs. Let us take you on a quick tour of our '
                'clinic to show you how we deliver on this promise.',


            style: TextStyle(
              fontWeight: FontWeight.w500,
              // fontSize: 12,
            ),
            textAlign: TextAlign.justify,
            softWrap: true,
          )
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
    return const Row(
      children: <Widget>[
        CardInfo(label: 'Patients', value: '100'),
        SizedBox(
          width: 15,
        ),
        CardInfo(label: 'Experience', value: '10 years'),
        SizedBox(
          width: 15,
        ),
        CardInfo(label: 'Rating', value: '4'),
      ],
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.label, required this.value});

  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Config.primaryColor),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 15,
      ),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ));
  }
}
