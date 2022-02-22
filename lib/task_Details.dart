

import 'dart:math';


import 'package:flutter/material.dart';

import 'edit_task.dart';

class TaskDetails extends StatefulWidget {
  final String title;
  final String date;
  //final String subTitle;
  final String startTime;
  final String endTime;
  final String notification;
  final String user;
  //final String color;

  TaskDetails(
      {this.title,
      this.date,
      this.startTime,
      this.endTime,
      this.notification,
      this.user}); // const TaskDetails({this.title, this.subTitle, this.notification, this.user});

  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {


//Text(widget.title),

  var imageNumber = Random().nextInt(4) + 1;
  var _asset;
  bool isChanged = false;
  Color color;
  String sTime;
  String eTime;
Function delete;
  @override
  void initState() {
    _asset = Image.asset(
      'images/i$imageNumber.jpg',
      fit: BoxFit.cover,
    );
    color = Colors.redAccent;
    sTime=widget.startTime;
    eTime=widget.endTime;
    super.initState();
  }

  _deleteEvent() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Delete'),
              content: Text('Are you sure to delete this item?'),
              actions: <Widget>[
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
                ElevatedButton(
                  child: Text('DELETE'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    print("delete");
                    print(delete);
                    //_deleteEvent();
                  },


                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 100.0,
      //   leading: IconButton(onPressed: (){
      //     Navigator.of(context).pop();
      //   }, icon: Icon(Icons.clear,color: Colors.white,),),
      //   title: Text(widget.title),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.more_vert),
      //     ),
      //   ],
      // ),

      body: Container(
        child: ListView(
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  color: Colors.lightBlue,
                  width: double.infinity,
                  height: 200,
                  child: isChanged ? color : _asset,
                  //child: _asset,

                  //decoration: BoxDecoration(image: DecorationImage(Image.asset('image/i2.jpg'))),
                ),
                Positioned(
                  left: 70,
                  bottom: 15,
                  child: Center(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      //color: Colors.redAccent,
                      color: color,
                    ),
                    child: IconButton(
                      onPressed: () async {
                        final data = await Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (context) => EditTask(
                              title: widget.title,
                              notification: widget.notification,
                              //startETime: widget.startTime.toString(),
                              //startETime: isChanged?sTime:widget.startTime,
                              startETime: widget.startTime,
                              endETime: widget.endTime,
                              eDate: widget.date,

                              eColorName: 'Default Color',
                              iconColor: Colors.blue,
                              // eIcon: Icon(Icons.circle,color: ,
                              // ),
                              //startTime: widget.,
                            ),
                          ),
                        )
                            .then((value) {
                          print('value');
                          print(value);
                          setState(() {

                            //sTime = value;
                            //eTime=value;
                            color=value;

                          });
                          print('value');
                          print(value);
                          print('asset');
                          print(_asset);
                          print('color');
                          print(color);
                        });
                        print('data');
                        print(data);
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  left: 10,
                  bottom: -20,
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  left: 10,
                ),
                // Positioned(
                //   child: IconButton(
                //     onPressed: () {
                //     },
                //     icon: Icon(
                //       Icons.more_vert,
                //       color: Colors.white,
                //     ),
                //   ),
                //   right: 10,
                // ),
                Positioned(
                  child: PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('Delete'),
                        value: 0,
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 0) {
                        _deleteEvent();
                      }
                    },
                  ),
                  right: 10,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              //title: Text(widget.subTitle),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.date.toString()),
                  //Text('${widget.startTime}-${widget.endTime}'),
                  Text('$sTime-$eTime'),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.notification_important),
              title: Text(widget.notification),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text("Event"),
              subtitle: Text(widget.user),
            ),
          ],
        ),
      ),
    );
  }
}
