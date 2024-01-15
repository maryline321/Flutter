import 'package:doctor_appointment/components/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/config.dart';
import '../utils/text.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key? key}) : super(key: key);

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? currentIndex;
  bool _isWeekend = false;
  bool dateSelected = false;
  bool _isTimeSelected = false;

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Appointment',
        icon: FaIcon(Icons.arrow_back_ios),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: [
                _tableCalendar(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                  child: Center(
                    child: Text(
                      'Select Consultation Time',
                      style: TextStyle (
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                  ),
                )
                // Add other widgets as needed
              ],
            ),
          ),
          _isWeekend
          ? SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10, vertical: 30
              ),
              alignment: Alignment.center,
              child: Text(
                'Weekend is not availabe, please select another date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),

              ),
            ),
          ): SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index)
              {
                return InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      _isTimeSelected= true;
                    });

                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: currentIndex == index
                            ? Colors.white
                            : Colors.black
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: currentIndex == index
                          ? Config.primaryColor
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Text (
                      '${index + 9}: 00 ${ index + 9 > 11 ? "PM" : "AM"}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: currentIndex == index? Colors.white: null,
                      ),
                    ),
                  ),
                );
              },
                childCount: 8
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 1.5
              ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child:   Center(
                child: SizedBox(
                  width: 200,
                  height: 50,// Set your desired width
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Config.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('success_page');
                    },
                    child: Text(
                      AppText.enText['appointment']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Config.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
      ),
      availableCalendarFormats: {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },

      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          dateSelected = true;

          if (selectedDay.weekday ==6 || selectedDay.weekday == 7)
          {
            _isWeekend = true;
            _isTimeSelected = false;
            currentIndex = null;
          }
          else {
            _isWeekend = false;
          }
        });
      },
    );
  }
}
