

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class EditTask extends StatefulWidget {
  //Event _events;
  String title;
  String startETime;
  String endETime;
  String notification;
  String place;
  String description;
  String eDate;
  String eColorName;
  Color iconColor;
  // Icon eIcon;

  EditTask({
    this.title,
    this.startETime,
    this.endETime,
    this.notification,
    this.place,
    this.description,
    this.eDate,
    this.eColorName,
    this.iconColor,
    //   this.eIcon
  }); //const EditTask({Key, key}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  String updatedNotificationValue;
  Color updatedNotificationColor;

  String colorValue;
  Color updatedColor;

  bool moreOptionVisibility = true;
  bool columnVisibility = false;

  bool timeVisibility = false;

  bool notificationVisibility1 = false;
  bool notificationVisibility2 = false;
  bool notificationVisibility3 = false;
  bool notificationVisibility4 = false;
  bool notificationVisibility5 = false;

  String notification1 = 'No notification';
  String notification2 = 'At time of event';
  String notification3 = '20 minutes before';
  String notification4 = '30 minutes before';
  String notification5 = 'Custom...';

  String color1 = 'Tomato';
  String color2 = 'Banana';
  String color3 = 'Lemon';
  String color4 = 'Orange';
  String color5 = 'Grape';
  String color6 = 'Blue Berry';
  String color7 = 'Default Color';

  bool colorVisibility1 = false;
  bool colorVisibility2 = false;
  bool colorVisibility3 = false;
  bool colorVisibility4 = false;
  bool colorVisibility5 = false;
  bool colorVisibility6 = false;
  bool colorVisibility7 = false;

  bool isSwitched = false;

  getSelectedValue() {
    if (widget.notification == 'No notification') {
      setState(() {
        notificationVisibility1 = true;
      });
    } else if (widget.notification == 'At time of event') {
      setState(() {
        notificationVisibility2 = true;
      });
    } else if (widget.notification == '20 minutes before') {
      setState(() {
        notificationVisibility3 = true;
      });
    } else if (widget.notification == '30 minutes before') {
      setState(() {
        notificationVisibility4 = true;
      });
    } else {
      setState(() {
        notificationVisibility5 = true;
      });
    }
  }

  String updatedStartTime;
  String updatedEndTime;

  getUpdatedData(Color x,String sTime,String eTime) {


     setState(() {
      updatedColor=x;
      updatedStartTime=sTime;
      updatedEndTime=eTime;
    });
    print('widget.startetime');
    print(widget.iconColor);
    print(widget.startETime);
  }

  getSelectedColor() {
    if (widget.eColorName == 'Tomato') {
      setState(() {
        colorVisibility1 = true;
      });
    } else if (widget.eColorName == 'Banana') {
      setState(() {
        colorVisibility2 = true;
      });
    } else if (widget.eColorName == 'Lemon') {
      setState(() {
        colorVisibility3 = true;
      });
    } else if (widget.eColorName == 'Orange') {
      setState(() {
        colorVisibility4 = true;
      });
    } else if (widget.eColorName == 'Grape') {
      setState(() {
        colorVisibility5 = true;
      });
    } else if (widget.eColorName == 'Blue Berry') {
      setState(() {
        colorVisibility6 = true;
      });
    } else {
      setState(() {
        colorVisibility7 = true;
      });
    }
  }

  @override
  void initState() {
    print('Widget.title');
    print(widget.title);
    print(widget.startETime);
    print('widget.notification');
    print(widget.notification);
    getSelectedValue();
    updatedNotificationValue = widget.notification;
    colorValue = widget.eColorName;
    updatedColor = widget.iconColor;
    //updatedStartTime=widget.startETime.toString();
    //updatedEndTime=widget.endETime.toString();
    //TimeOfDay _startTime = TimeOfDay(hour:int.parse(s.split(":")[0]),minute: int.parse(s.split(":")[1]));
   // updatedStartTime=TimeOfDay(hour: int.parse(widget.startETime.split(" :")[0]),);
    // minute: int.parse(widget.startETime.split(" : ")[1])
    //updatedEndTime=TimeOfDay(hour: int.parse(widget.endETime.split(" :")[0]),);

    print("updated Color");
    print(updatedColor);
    print('updatedStartTime');
    print(updatedStartTime);
    //icon=widget.eIcon;

    getSelectedColor();
   // getUpdatedData();
    print('widget.eColor');
    //print(widget.eColor);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: updatedColor, statusBarBrightness: Brightness.dark));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  //color: Colors.lightBlue,
                  color: updatedColor,
                  width: double.infinity,
                  height: 150,
                ),
                Positioned(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  bottom: 10,
                  left: 8,
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
                Positioned(
                  child: TextButton(
                    onPressed: () {
                      //Navigator.of(context).pop(context);
                     // Navigator.pop(context, updatedStartTime);
                     // Navigator.pop(context,getUpdatedData(updatedColor,updatedStartTime,updatedEndTime));
                     Navigator.pop(context,updatedColor);
                    },
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  right: 10,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  ListTile(
                    leading: Icon(Icons.schedule),
                    title: Text('All Day'),
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: (bool value) {
                        setState(() {
                          isSwitched = value;
                          timeVisibility = !timeVisibility;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text(widget.eDate.toString()),
                    trailing: Visibility(
                        visible: !timeVisibility,
                        child: InkWell(
                         //child: Text('$updatedStartTime'),
                          child: Text(widget.startETime.toString()),
                          // child: Text(
                          //   //'$updatedStartTime'
                          //   updatedStartTime.toString(),
                          // ),
                          onTap: _startTimePicker,
                        )),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text(widget.eDate.toString()),
                    trailing: Visibility(
                        visible: !timeVisibility,
                        child: InkWell(
                          child: Text(widget.endETime.toString()),
                          //child: Text('$updatedEndTime'),
                          // child: Text(
                          //   updatedEndTime.toString(),
                          // ),

                          onTap: _endTimePicker,
                        )),
                  ),
                  Visibility(
                    visible: moreOptionVisibility,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          moreOptionVisibility = false;
                          columnVisibility = true;
                        });
                      },
                      child: ListTile(
                        leading: Text(''),
                        title: Text('More Option'),
                        //trailing: Text(widget.startETime),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: columnVisibility,
                    child: Column(
                      children: <Widget>[
                        Divider(
                          height: 2,
                        ),
                        ListTile(
                          title: Text('Bangladesh Standard Time'),
                          leading: Icon(Icons.public),
                        ),
                        Divider(
                          height: 2,
                        ),
                        ListTile(
                          title: Text(
                            'Do Not Repeat',
                          ),
                          leading: Icon(Icons.refresh),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 1.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.place),
                    // title: TextButton(
                    //   child: Text('Add Location'),
                    //   onPressed: () {},
                    // ),
                    title: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Add Place'),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.notification_important),
                    title: InkWell(
                      child: Text(updatedNotificationValue),
                      //child: Text(widget.notification),
                      onTap: _notification,
                    ),
                  ),
                  ListTile(
                    leading: Text(''),
                    title: Text('Add Another Notification'),
                  ),
                  ListTile(
                    leading: Icon(Icons.people),
                    title: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Invite People'),
                    ),
                  ),
                  Divider(
                    height: 1.0,
                  ),
                  InkWell(
                    onTap: _colorPalette,
                    child: ListTile(
                      leading: Icon(
                        Icons.circle,
                        color: updatedColor,
                        size: 15,
                      ),
                      title: Text(colorValue),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.topic,
                      // color: Colors.blue,
                    ),
                    title: Text('Add Note'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add_to_drive,
                      //color: Colors.blue,
                    ),
                    title: Text('Add Attachment'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _notification() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              //updatedValue=notification1;
                              _updateNotification(notification1, Colors.blue);

                              notificationVisibility1 = true;
                              notificationVisibility2 = false;
                              notificationVisibility3 = false;
                              notificationVisibility4 = false;
                              notificationVisibility5 = false;
                              Navigator.of(context).pop();

                              print('hello');
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notification1,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: notificationVisibility1
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                visible: notificationVisibility1,
                                child: Icon(Icons.done,
                                    color: notificationVisibility1
                                        ? updatedNotificationColor
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _updateNotification(notification2, Colors.blue);
                              //_notificationVisibility(false, true, false, false, false);

                              notificationVisibility1 = false;
                              notificationVisibility2 = true;
                              notificationVisibility3 = false;
                              notificationVisibility4 = false;
                              notificationVisibility5 = false;
                              //_selectedNotification = notification2;
                              Navigator.of(context).pop(true);

                              print('hello2');
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notification2,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: notificationVisibility2
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                visible: notificationVisibility2,
                                child: Icon(Icons.done,
                                    color: notificationVisibility2
                                        ? updatedNotificationColor
                                        : Colors.black),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notification3,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: notificationVisibility3
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                visible: notificationVisibility3,
                                child: Icon(Icons.done,
                                    color: notificationVisibility3
                                        ? updatedNotificationColor
                                        : Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateNotification(notification3, Colors.blue);
                              //_notificationVisibility(false, false, true, false, false);

                              notificationVisibility1 = false;
                              notificationVisibility2 = false;
                              notificationVisibility3 = true;
                              notificationVisibility4 = false;
                              notificationVisibility5 = false;
                              //_selectedNotification = notification3;
                              Navigator.of(context).pop(true);
                            });
                          },
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notification4,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: notificationVisibility4
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                visible: notificationVisibility4,
                                child: Icon(Icons.done,
                                    color: notificationVisibility4
                                        ? updatedNotificationColor
                                        : Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateNotification(notification4, Colors.blue);
                              // _notificationVisibility(false, false, false, true, false);

                              notificationVisibility1 = false;
                              notificationVisibility2 = false;
                              notificationVisibility3 = false;
                              notificationVisibility4 = true;
                              notificationVisibility5 = false;
                              //_selectedNotification = notification4;
                              Navigator.of(context).pop(true);
                            });
                          },
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                notification5,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: notificationVisibility5
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                visible: notificationVisibility5,
                                child: Icon(Icons.done,
                                    color: notificationVisibility5
                                        ? updatedNotificationColor
                                        : Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateNotification(notification5, Colors.blue);
                              //_notificationVisibility(false, false, false, false, true);

                              notificationVisibility1 = false;
                              notificationVisibility2 = false;
                              notificationVisibility3 = false;
                              notificationVisibility4 = false;
                              notificationVisibility5 = true;

                              Navigator.of(context).pop(true);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ));
  }

  _colorPalette() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Container(
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.circle,
                                color: Colors.red,
                              ),
                              Text(
                                color1,
                                style: TextStyle(
                                    color: colorVisibility1
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                child: Icon(Icons.done,
                                    color: colorVisibility1
                                        ? updatedNotificationColor
                                        : Colors.black),
                                visible: colorVisibility1,
                              ),
                            ],
                          ),
                          onTap: () {
                            _updateColor(color1, Colors.blue, Colors.red);
                            print('updated Color');
                            print(updatedColor);
                            setState(() {
                              colorVisibility1 = true;
                              colorVisibility2 = false;
                              colorVisibility3 = false;
                              colorVisibility4 = false;
                              colorVisibility5 = false;
                              colorVisibility6 = false;
                              colorVisibility7 = false;
                              Navigator.of(context).pop();
                              print('test1');
                            });
                          },
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.circle,
                                color: Colors.yellow,
                              ),
                              Text(
                                color2,
                                style: TextStyle(
                                    color: colorVisibility2
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                child: Icon(Icons.done,
                                    color: colorVisibility2
                                        ? updatedNotificationColor
                                        : Colors.black),
                                visible: colorVisibility2,
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateColor(color2, Colors.blue, Colors.yellow);
                              colorVisibility1 = false;
                              colorVisibility2 = true;
                              colorVisibility3 = false;
                              colorVisibility4 = false;
                              colorVisibility5 = false;
                              colorVisibility6 = false;
                              colorVisibility7 = false;
                              Navigator.of(context).pop();
                              print('test2');
                            });
                          },
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.circle, color: Colors.lightGreen),
                              Text(
                                color3,
                                style: TextStyle(
                                    color: colorVisibility3
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                child: Icon(Icons.done,
                                    color: colorVisibility3
                                        ? updatedNotificationColor
                                        : Colors.black),
                                visible: colorVisibility3,
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateColor(
                                  color3, Colors.blue, Colors.lightGreen);
                              colorVisibility1 = false;
                              colorVisibility2 = false;
                              colorVisibility3 = true;
                              colorVisibility4 = false;
                              colorVisibility5 = false;
                              colorVisibility6 = false;
                              colorVisibility7 = false;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.circle, color: Colors.orange),
                              Text(
                                color4,
                                style: TextStyle(
                                    color: colorVisibility4
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                child: Icon(Icons.done,
                                    color: colorVisibility4
                                        ? updatedNotificationColor
                                        : Colors.black),
                                visible: colorVisibility4,
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateColor(color4, Colors.blue, Colors.orange);
                              colorVisibility1 = false;
                              colorVisibility2 = false;
                              colorVisibility3 = false;
                              colorVisibility4 = true;
                              colorVisibility5 = false;
                              colorVisibility6 = false;
                              colorVisibility7 = false;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.circle, color: Colors.deepPurple),
                              Text(
                                color5,
                                style: TextStyle(
                                    color: colorVisibility5
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                child: Icon(Icons.done,
                                    color: colorVisibility5
                                        ? updatedNotificationColor
                                        : Colors.black),
                                visible: colorVisibility5,
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateColor(
                                  color5, Colors.blue, Colors.deepPurple);
                              colorVisibility1 = false;
                              colorVisibility2 = false;
                              colorVisibility3 = false;
                              colorVisibility4 = false;
                              colorVisibility5 = true;
                              colorVisibility6 = false;
                              colorVisibility7 = false;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.circle,
                                color: Colors.indigo,
                              ),
                              Text(
                                color6,
                                style: TextStyle(
                                    color: colorVisibility6
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                child: Icon(Icons.done,
                                    color: colorVisibility6
                                        ? updatedNotificationColor
                                        : Colors.black),
                                visible: colorVisibility6,
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateColor(color6, Colors.blue, Colors.indigo);
                              colorVisibility1 = false;
                              colorVisibility2 = false;
                              colorVisibility3 = false;
                              colorVisibility4 = false;
                              colorVisibility5 = false;
                              colorVisibility6 = true;
                              colorVisibility7 = false;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                        InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                Icons.circle,
                                color: Colors.blue,
                              ),
                              Text(
                                color7,
                                style: TextStyle(
                                    color: colorVisibility7
                                        ? updatedNotificationColor
                                        : Colors.black),
                              ),
                              Visibility(
                                child: Icon(Icons.done,
                                    color: colorVisibility7
                                        ? updatedNotificationColor
                                        : Colors.black),
                                visible: colorVisibility7,
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              _updateColor(color7, Colors.blue, Colors.blue);
                              colorVisibility1 = false;
                              colorVisibility2 = false;
                              colorVisibility3 = false;
                              colorVisibility4 = false;
                              colorVisibility5 = false;
                              colorVisibility6 = false;
                              colorVisibility7 = true;
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ));
  }

  _updateNotification(String value, Color x) {
    print('ok1');
    setState(() {
      updatedNotificationValue = value;
      updatedNotificationColor = x;
    });
    print('ok2');
  }

  _updateColor(String value, Color x, Color y) {
    print('ok3');
    setState(() {
      colorValue = value;
      updatedNotificationColor = x;
      updatedColor = y;
    });
    print('ok4');
  }

  _startTimePicker() {
    //TimeOfDay _currentTime = TimeOfDay(hour:int.parse(widget.startETime.split(":")[0]),minute: int.parse(widget.startETime.split(":")[1]));
    TimeOfDay _currentTime =
        TimeOfDay.fromDateTime(DateFormat.jm().parse(widget.startETime));

    showTimePicker(context: context, initialTime: _currentTime).then((value) {
      setState(() {
        widget.startETime = value.format(context).toString();
        //updatedStartTime=widget.startETime;

      });
    });
    // DateFormat("hh:mm a").parse(widget.startETime));
  }

  _endTimePicker() {
    //TimeOfDay _currentTime = TimeOfDay(hour:int.parse(widget.startETime.split(":")[0]),minute: int.parse(widget.startETime.split(":")[1]));
    //TimeOfDay _currentTime = TimeOfDay.fromDateTime(DateFormat.jm().parse(widget.endETime));
    TimeOfDay _currentTime =
        TimeOfDay.fromDateTime(DateFormat.Hm().parse(widget.endETime));

    showTimePicker(context: context, initialTime: _currentTime).then((value) {
      setState(() {
        widget.endETime = value.format(context).toString();

      });
    });
    // DateFormat("hh:mm a").parse(widget.startETime));
  }

  _expansion() {
    return ExpansionTile(
      //backgroundColor: Colors.red,

      leading: Text(''),
      title: Text(
        "More Option",
        style: TextStyle(color: Colors.black),
        // style: TextStyle(
        //     fontSize: 18.0,
        //     fontWeight: FontWeight.bold
        // ),
      ),
      children: <Widget>[
        Divider(
          height: 2,
        ),
        ListTile(
          title: Text('Bangladesh Standard Time'),
          leading: Icon(Icons.public),
        ),
        Divider(
          height: 2,
        ),
        ListTile(
          title: Text(
            'Do Not Repeat',
          ),
          leading: Icon(Icons.refresh),
        )
      ],
    );
  }

  _visibility() {
    bool _isVisible = false;
    setState(() {
      _isVisible = !_isVisible;
      print('_isVisible');
      print(_isVisible);
    });
    return Visibility(
      maintainAnimation: true,
      maintainState: true,
      maintainSemantics: true,
      maintainSize: true,
      visible: _isVisible,
      child: Column(
        children: <Widget>[
          Divider(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.public),
              Text('Bangladesh Standard Time'),
            ],
          ),
          Divider(
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(Icons.refresh),
              Text('Do Not Repeat'),
            ],
          ),
          Divider(
            height: 1,
          ),
        ],
      ),
    );
  }
}
