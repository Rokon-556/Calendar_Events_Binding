import 'dart:collection';
import 'dart:convert';

import 'package:calendar/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'task_Details.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key key}) : super(key: key);
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  // var sTime = DateFormat.Hms().format(DateTime.now());
  // var eTime = DateFormat.Hms().format(
  //   DateTime.now().add(
  //     Duration(hours: 2),
  //   ),
  // );
  // String time;

  //DateTime date;
  _formatDate(DateTime date) {
    var formattedDate = DateFormat.MMMMEEEEd().format(date);
    return formattedDate;
  }

  static String jsonString = """
   [{
       "id": 1,
   "title": "Calendar View",
   "date":"2022-02-08 12:21:35.324068",
   "startTime":"2022-02-08 12:21:35.324068",
   "endTime":"2022-02-08 14:21:35.324068",
   "notification": "20 minutes before",
   "user": "rokon@com",
   "description": "watching calendar events"
},
{
       "id": 2,
   "title": "Calendar View Widget",
   "date":"2022-02-15 12:21:35.324068",
   "startTime":"2022-02-15 12:21:35.324068",
   "endTime":"2022-02-15 16:21:35.324068",
   "notification": "10 minutes before",
   "user": "rahman@com",
   "description": "watching calendar events functionality"
},
{
       "id": 3,
   "title": " View Movies",
   "date":"2022-02-20 10:21:35.324068",
   "startTime":"2022-02-20 17:21:35.324068",
   "endTime":"2022-02-20 19:21:35.324068",
   "notification": "50 minutes before",
   "user": "abdur@com",
   "description": "watching calendar events movies"
}
]""";

  LinkedHashMap<DateTime, List<Event>> _kEvents;
  List<Event> _events = getEvents();

  static List<Event> getEvents() {
    List<Event> eventList = [];
    var jsonStr = json.decode(jsonString);
    eventList = List<Event>.from(jsonStr.map((x) => Event.fromMap(x)));

    return eventList;
  }

  TextEditingController _eventController = TextEditingController();
  _kEvent(List<Event> events) {
    _kEvents = LinkedHashMap(equals: isSameDay, hashCode: getHashCode);
    // ..addAll(
    //   {
    //     kToday: [Event(title: 'Event1'), Event(title: 'Event2')],
    //     kNextDay: [Event(title: 'Events3'), Event(title: 'Events4')],
    //   },
    // )

    events.forEach((event) {
      DateTime date =
          DateTime.utc(event.date.year, event.date.month, event.date.day, 12);
      print('date:$date');
      if (_kEvents[date] == null) _kEvents[date] = [];
      _kEvents[date].add(event);
    });
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void initState() {
    //selectedEvents = ValueNotifier(_getEventsFromDay(selectedDay));
    //selectedEvents = {};
    //_events = [];
    _kEvent(_events);
    super.initState();
  }

  List<Event> _getEventsFromDay(DateTime date) {
    return _kEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Calendar"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
                //_events = _getEventsFromDay(selectedDay);
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            onDayLongPressed: (DateTime selectDay, DateTime focusDay) {
              print('selectday');
              print(selectDay);
              print(selectDay.runtimeType);

              // DateFormat('dd').format(
              //     DateFormat("yyyy-MM-dd")
              //         .parse(selectDay.toString(), true)
              //         .toLocal());
              // var formattedDay = DateFormat('EEEE').format(
              //     DateFormat("yyyy-MM-dd")
              //         .parse(selectDay.toString(), true)
              //         .toLocal());
              // var formattedMonth = DateFormat('MM').format(
              //     DateFormat('yyyy-MM-dd')
              //         .parse(selectDay.toString(), true)
              //         .toLocal());
              // var xTime=DateTime.utc(selectedDay);
              //var xTime = selectedDay.toUtc();
              //var xTime = DateFormat('kk:mm').format(selectedDay);

              print('formattedDate');
              // print(formattedDate);
              print('formattedDay');
              //print(formattedDay);

              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        title: Container(
                          width: double.infinity,
                          height: 50.0,
                          //color: Colors.white38.withOpacity(0.5),
                          decoration: new BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Center(
                            child: Text(
                              // '$formattedDate\n$formattedDay',
                              //'$formattedDate',
                              '${_formatDate(selectDay)}',

                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              //textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        content: Container(
                          height: 300,
                          child: Column(
                            children: <Widget>[
                              ..._getEventsFromDay(selectedDay).map(
                                (Event event) => Container(
                                  //width: double.infinity,
                                  // padding: EdgeInsets.all(4),
                                  //margin: EdgeInsets.only(bottom: 12),

                                  //color: event.eventBackgroundColor,
                                  child: InkWell(
                                    child: Column(
                                      //mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          //mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Icon(
                                              Icons.label_important,
                                              //color: Colors.redAccent,
                                              color: Color(0xff7D6608),
                                              size: 20.0,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.start,
                                              //mainAxisAlignment: MainAxisAlignment.end,
                                              //mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  event.title,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  //'${event.startTime}-${event.endTime}',
                                                  //'$sTime-$eTime',
                                                  //TimeOfDay.fromDateTime(DateTime time),
                                                    //TimeOfDay.fromDateTime(DateFormat('yyyy-MM-dd HH:mm:ss').parse(json['startTime'])
                                                  //'${TimeOfDay.fromDateTime(DateFormat("hh:mma").parse(event.startTime))}',
                                                  '${DateFormat("hh:mma").format(event.startTime)} - ${DateFormat("hh:mma").format(event.endTime)}',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 70,
                                            ),
                                            Expanded(child: Icon(Icons.people)),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                    // ListTile(
                                    //   //color: Colors.blue,
                                    //   title: Text(
                                    //     event.title,
                                    //     style: TextStyle(
                                    //         color: Colors.black,
                                    //         fontWeight: FontWeight.bold),
                                    //   ),
                                    //   leading: Icon(
                                    //     Icons.circle,
                                    //     color: Colors.blue,
                                    //     size: 10.0,
                                    //   ),
                                    //   subtitle: Text('$sTime- \n $eTime'),
                                    //   trailing: Icon(Icons.people),
                                    // ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => TaskDetails(
                                              title: event.title,
                                              //startTime: event.startTime,
                                              
                                              //   TimeOfDay.fromDateTime(DateFormat.jm().parse(widget.startETime))
                                              startTime: DateFormat("hh:mm a")
                                                  .format(event.startTime),
                                              
                                              //TimeOfDay _startTime = TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));
                                              //TimeOfDay _time = TimeOfDay(hour:int.parse(string.split(":")[0]),minute: int.parse(string.split(":")[1].split(" ")[0]));
                                             // startTime: TimeOfDay(hour: int.parse(event.startTime.split(":")[0])),

                                              endTime: DateFormat("hh:mm a")
                                                  .format(event.endTime),
                                              date: _formatDate(selectDay),
                                              notification: event.notification,
                                              user: event.user),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          FloatingActionButton(
                            onPressed: () {
                              print('Float Got Pressed');
                            },
                            child: Icon(Icons.add),
                            backgroundColor: Colors.redAccent,
                          ),
                        ],
                      ));
            },

            eventLoader: _getEventsFromDay,
            weekendDays: const [DateTime.friday, 6],
            //giving .

            //To style the Calendar
            calendarStyle: CalendarStyle(
              markerDecoration: BoxDecoration(
                //color: Colors.brown,
                color: Color(0xff7D6608),
                //color: Color.fromRGBO(211, 84, 0, 1),
                shape: BoxShape.circle,
              ),
              markerSize: 7,
              markersMaxCount: 3,
              markerMargin: EdgeInsets.all(1.5),
              weekendTextStyle: TextStyle(color: Colors.red),
              // holidayTextStyle: TextStyle(color: const Color(0xFF5C6BC0)),
              // holidayDecoration: const BoxDecoration(
              //     border: const Border.fromBorderSide(const BorderSide(
              //         color: const Color(0xFF9FA8DA), width: 1.4)),
              //     shape: BoxShape.circle),
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                // color: Colors.blue,
                //color: Colors.greenAccent.shade400,
                color: Color(0xff5cdb95),

                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              todayDecoration: BoxDecoration(
                color: Color(0xff8be8b4),
                //color: Colors.purpleAccent,
                //color: Colors.amberAccent,
                //(0xff+hexCode)
                // color:Colors.greenAccent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                //color: Colors.blue,
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsFromDay(selectedDay).map(
            (Event event) => Card(
              child: ListTile(
                title: Text(
                  event.title,
                ),
                trailing: TextButton(
                  child: Text(
                    'Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.greenAccent,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.redAccent,
      //   onPressed: () =>
      //       //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddTask())),
      //       //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DayView())),
      //       //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DateTimeSelectorFormField())),
      //       showDialog(
      //     context: context,
      //     builder: (context) => AlertDialog(
      //       title: Text("Add Event"),
      //       content: Column(
      //         children: <Widget>[
      //           TextFormField(
      //             controller: _eventController,
      //           ),
      //         ],
      //       ),
      //       actions: [
      //         TextButton(
      //           child: Text("Cancel"),
      //           onPressed: () => Navigator.pop(context),
      //         ),
      //         TextButton(
      //           child: Text("Ok"),
      //           onPressed: () {
      //             if (_eventController.text.isEmpty) {
      //               print('empty checking ok');
      //             } else {
      //               print(' not empty checking ok1');
      //               // selectedEvents[selectedDay] = };
      //               if (_kEvents[selectedDay] != null) {
      //                 print('selected events not null');
      //                 _kEvents[selectedDay].add(
      //                   Event(title: _eventController.text),
      //                 );
      //                 print('selected events after adding successfully');
      //               } else {
      //                 print('selected events  null');
      //                 print(_kEvents[selectedDay]);
      //                 _kEvents[selectedDay] = [
      //                   Event(title: _eventController.text)
      //                 ];
      //               }
      //             }
      //
      //             // setState(() {
      //             //     if (selectedEvents[selectedDay] != null) {
      //             //       selectedEvents[selectedDay].add(
      //             //         Event(title: _eventController.text),
      //             //       );
      //             //     } else {
      //             //       selectedEvents[selectedDay] = [
      //             //         Event(title: _eventController.text)
      //             //       ];
      //             //     }
      //             // });
      //
      //             Navigator.pop(context);
      //             _eventController.clear();
      //             setState(() {});
      //             return;
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      //   label: Text("Add Event"),
      //   icon: Icon(Icons.add),
      // ),
    );
  }
}
