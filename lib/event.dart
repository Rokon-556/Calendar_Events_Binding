


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



final kToday = DateTime.now();

final kNextDay = kToday.add(Duration(days: 2));
// final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class Event {
   int id;
   String title;
   DateTime date;
   DateTime startTime;
   DateTime endTime;
   String notification;
   String user;
   String description;
   Color color;
   //String location;




   Event({this.id,this.title, this.date, this.startTime, this.endTime, this.notification,
     this.user,this.description,this.color});

   @override
  String toString() {
    return 'Event{title: $title, date: $date, startTime: $startTime, endTime: $endTime, notification: $notification, user: $user, description: $description}';
  }
  Map<String,dynamic>toJson(){
     return{
       'id':id,
       'title':title,
       'date':date.microsecondsSinceEpoch,
       'startTime':startTime,
       'endTime':endTime,
       'notification':notification,
       'user':user,
       'description':description
     };
  }
  factory Event.fromMap(Map<String,dynamic>json){
     if(json==null){

     }
     return Event(
       id: json['id'],
       title: json['title'],
       date: DateFormat('yyyy-MM-dd').parse(json['date']),
       startTime:  DateFormat('yyyy-MM-dd HH:mm:ss').parse(json['startTime']),
       endTime: DateFormat('yyyy-MM-dd HH:mm:ss').parse(json['endTime']),
       notification: json['notification'],
       user: json['user'],
       description: json['description'],


     );
  }

  factory Event.fromDS(int id,Map<String,dynamic>data){
     if(data==null){}
     return Event(
       id: id,
       title: data['title'],
       //id:id,
       date: DateTime.fromMillisecondsSinceEpoch(data['date']),
       startTime: data['startTime'],
       endTime: data['endTime'],
       notification: data['notification'],
       user:data['user'],
       description: data['description']
     );
   }
}

// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )
// ..addAll(
//     {
//       kToday: [Event(title: 'Event1'), Event(title: 'Event2')],
//       kNextDay: [Event(title: 'Events3'), Event(title: 'Events4')],
//     },
//   );




// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }

// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last
//       .difference(first)
//       .inDays + 1;
//   return List.generate(
//     dayCount,
//         (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }
