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
    "doctor_name":"Richard",
    "doctor_profile":"assets/images/doctor1.png",
    "category":"Dental",
    "status":FilterStatus.upcoming,
  },
  {
    "doctor_name":"Cher",
    "doctor_profile":"assets/images/doctor.png",
    "category":"cardiology",
    "status":FilterStatus.complete,
  },
  {
    "doctor_name":"Allan",
    "doctor_profile":"images/doctor.png",
    "category":"Dental",
    "status":FilterStatus.complete,
  },
  {
    "doctor_name":"Test",
    "doctor_profile":"images/doctor.png",
    "category":"Respiration",
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
    Config.init(context);
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
                                  _alignment = Alignment.center;
                                }
                                else if (filterStatus == FilterStatus.cancel) {
                                  status = FilterStatus.cancel;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child:
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust the padding as needed
                                child: Text(
                                  filterStatus.name,
                                ),
                              ),
                            )

                          ))
                      ],
                    ),
                  ),
                  AnimatedAlign(
                      alignment: _alignment,
                      duration: const Duration(milliseconds: 200),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Config.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          status.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Config.spaceSmall,
              Expanded(
                  child: ListView.builder(
                    itemCount: filteredSchedules.length,
                      itemBuilder: ((context, index)
                      {
                        var _schedule = filteredSchedules[index];
                        bool islastElement = filteredSchedules.length + 1 == index;
                        return Card(
                          shape: RoundedRectangleBorder(

                            side:  BorderSide(
                              color: Colors.grey,
                            ),borderRadius: BorderRadius.circular(20)
                          ),
                          margin: !islastElement
                          ? const EdgeInsets.only(bottom: 20)
                              :EdgeInsets.zero,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: AssetImage( _schedule['doctor_profile'] ),
                                    ),
                                   SizedBox(
                                     width: 10,
                                   ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _schedule['doctor_name'] ,

                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          _schedule['category'] ,

                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),

                                      ],
                                    ),

                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                ScheduleCard(),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          fixedSize: const Size(double.infinity, 5),
                                        ),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Config.primaryColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5,),

                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Config.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          fixedSize: const Size(double.infinity, 5),
                                        ),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                        );
                      })
                  )
              ),

            ],
        ),
      ),
    );
  }
}


class ScheduleCard extends StatelessWidget {

  const ScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.calendar_today,
            color: Config.primaryColor,
            size: 15,
          ),
          SizedBox(width: 5,),
          Text(
            'Wednesday 10/1/2023',
            style: TextStyle(color: Config.primaryColor),
          ),
          SizedBox(width: 20,),
          Icon(Icons.access_alarm,
            color:Config.primaryColor,
            size: 17,
          ),
          SizedBox(width: 5,),
          Flexible(
            child: Text(
              '12.00 pm',
              style: TextStyle(color: Config.primaryColor),
            ),)
        ],
      ),
    );
  }
}