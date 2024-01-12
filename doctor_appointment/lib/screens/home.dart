import 'package:doctor_appointment/screens/appointment_card.dart';
import 'package:doctor_appointment/screens/doctors_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> medcat = [
    {
      "icon":FontAwesomeIcons.userDoctor,
      "category":"General",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icon":FontAwesomeIcons.lungs,
      "category":"Respirations",
    },
    {
      "icon":FontAwesomeIcons.hand,
      "category":"Dermatology",
    },
    {
      "icon":FontAwesomeIcons.personPregnant,
      "category":"Gynecology",
    },
    {
      "icon":FontAwesomeIcons.teeth,
      "category":"Dental",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Scaffold(
     body: Padding(padding: const EdgeInsets.symmetric(
       horizontal: 15,
       vertical: 15
     ),
       child: SafeArea(
         child:SingleChildScrollView(
           child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           const Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Text(
                 'Rose',
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(
                 child:  CircleAvatar(
                   radius: 30,
                   backgroundImage: 
                   AssetImage('assets/images/profile.png'),
                 ),
               )
             ],
           ),
           Config.spaceSmall,
           const Text(
             'Category',
             style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),
           ),
           Config.spaceSmall,
           SizedBox(
             height: Config.heightSize * 0.05,
             child: ListView(
               scrollDirection: Axis.horizontal,
               children: List<Widget>.generate(medcat.length, (index){
                 return Card(
                   margin: const EdgeInsets.only(right: 20),
                   color: Config.primaryColor,
                   child: Padding(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 15, vertical: 10
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: <Widget>[
                         FaIcon(
                           medcat[index]['icon'],
                           color: Colors.white,
                         ),
                         const SizedBox(
                           width: 20,
                         ),
                         Text(
                           medcat[index]['category'],
                           style: const TextStyle(
                             fontSize: 16,
                             color: Colors.white
                           ),
                         )
                       ],
                     ),
                   ),
                 );
               },
               ),
             ),

           ),
           Config.spaceSmall,
           const Text(
             'Appointment Today',
             style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),
           ),
            Config.spaceSmall,
           const AppointmentCard(),
           Config.spaceSmall,
           const Text(
             'Top Doctors',
             style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),
           ),
           Config.spaceSmall,
           Column(
             children: List.generate(10, (index){
               return const DoctorsCard(route: 'doc_details',);
             } )
             ,
           )
          ],
       )

       )
       )
     ),
    );
  }
}