import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  var now = DateTime.now();
  var time = TimeOfDay(hour: 10, minute: 30);

  var thirdNow = DateTime.now();

  _showDatePicker() async {
    var result = await showDatePicker(context: context, initialDate: now, firstDate: DateTime(1980), lastDate: DateTime(2100));
    setState(() {
      if (result != null) {
        now = result;
      }
    });
  }

  _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: time);
    setState(() {
      if (result != null) {
        time = result;
      }
    });
  }

  _showThirdDatePicker() async {
    DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime(1980),
      maxTime: DateTime(2100),
      currentTime: now,
      locale: LocaleType.zh,
      onConfirm: (date) {
        setState(() {
          thirdNow = date;
        });
      }
    );
  }

  _showThirdTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: time);
    setState(() {
      if (result != null) {
        time = result;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print(now);
//    print(now.millisecondsSinceEpoch);
//    print(DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch));
    print(formatDate(now, [yyyy, '-', mm, '-', dd]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "DatePicker",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(formatDate(now, [yyyy, '-', mm, '-', dd])),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: _showDatePicker,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(time.format(context)),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: _showTimePicker,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(formatDate(thirdNow, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn])),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: _showThirdDatePicker,
              )
            ],
          )
        ],
      ),
    );
  }
}
