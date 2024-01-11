import 'package:doctor_appointment/utils/config.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({ super.key });

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}
enum FilterStatus {upcoming, complete, cancel}
class _AppointmentScreenState extends State<AppointmentScreen> {
FilterStatus status = FilterStatus.upcoming;
Alignment _alignment = Alignment.centerLeft;
List<dynamic> schedules = [
  {
    "doctor_image":"Richard",
    "doctor_profile":"assets/images/doctor1.png",
    "category":"Dental",
    "status":FilterStatus.upcoming,
  },
  {
    "doctor_image":"Richard",
    "doctor_profile":"assets/images/doctor1.png",
    "category":"cardiology",
    "status":FilterStatus.complete,
  },
  {
    "doctor_image":"Richard",
    "doctor_profile":"assets/images/doctor1.png",
    "category":"DentRespiration",
    "status":FilterStatus.cancel,
  }

];

  @override
  Widget build(BuildContext context) {

    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'complete':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      //   case 'cancel':
      //     schedule['status'] = FilterStatus.upcoming;
      //     break;
      // }
      return schedule['status'] == status ;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Appointment Schedule',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),

              ),
              Config.spaceSmall,
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (FilterStatus filterStatus in FilterStatus.values)
                          Expanded(child: GestureDetector(
                            onTap: () {
                              setState((){
                                if (filterStatus == FilterStatus.upcoming) {
                                  status = FilterStatus.upcoming;
                                  _alignment = Alignment.centerLeft;
                                }
                                else if (filterStatus == FilterStatus.complete) {
                                  status = FilterStatus.complete;
                                  _alignment = Alignment.centerLeft;
                                }
                                else if (filterStatus == FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerLeft;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ))
                      ],
                    ),
                  ),
                ],
              )

            ],
        ),
      ),
    );
  }
}